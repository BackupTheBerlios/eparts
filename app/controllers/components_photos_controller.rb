class ComponentsPhotosController < ApplicationController
  # GET /components_photos
  # GET /components_photos.xml
  def index
    @components_photos = ComponentsPhoto.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @components_photos }
    end
  end

  # GET /components_photos/1
  # GET /components_photos/1.xml
  def show
    @components_photo = ComponentsPhoto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @components_photo }
    end
  end

  # GET /components_photos/new
  # GET /components_photos/new.xml
  def new
    @components_photo = ComponentsPhoto.new
    @component = Component.find( params[:component_id] )

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @components_photo }
    end
  end

  # GET /components_photos/1/edit
  def edit
    #@component = Component.find( params[:component_id] )
    #@component = Component.find( 2 )
    #@components_photo = @component.components_photos.find( :first )
    @components_photos = ComponentsPhoto.find( :all, :conditions => {:component_id => 2} )
  end

  # POST /components_photos
  # POST /components_photos.xml
  def create
    @components_photo = ComponentsPhoto.new( params[:components_photo] )

    respond_to do |format|
      if @components_photo.save
        flash[:notice] = 'ComponentsPhoto was successfully created.'
        format.html { redirect_to( edit_component_path(@components_photo.component) ) }
        format.xml  { render :xml => @components_photo, :status => :created, :location => @components_photo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @components_photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /components_photos/1
  # PUT /components_photos/1.xml
  def update
    @components_photo = ComponentsPhoto.find(params[:id])
    #x = self.find( :first, :conditions = ‘product_id = ? and option_id = ?’, product.id, option.id] )

    respond_to do |format|
      if @components_photo.update_attributes(params[:components_photo])
        flash[:notice] = 'ComponentsPhoto was successfully updated.'
        format.html { redirect_to(@components_photo) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @components_photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /components_photos/1
  # DELETE /components_photos/1.xml
  def destroy
    @components_photo = ComponentsPhoto.find(params[:id])
    @components_photo.destroy

    respond_to do |format|
      format.html { redirect_to(components_photos_url) }
      format.xml  { head :ok }
    end
  end
end
