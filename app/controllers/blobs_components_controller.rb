class BlobsComponentsController < ApplicationController
  # GET /blobs_components
  # GET /blobs_components.xml
  def index
    @blobs_components = BlobsComponent.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @blobs_components }
    end
  end

  # GET /blobs_components/1
  # GET /blobs_components/1.xml
  def show
    @blobs_component = BlobsComponent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @blobs_component }
    end
  end

  # GET /blobs_components/new
  # GET /blobs_components/new.xml
  def new
    @components_blob = BlobsComponent.new
    @component = Component.find( params[:component_id] )

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @components_blob }
    end
  end

  # GET /blobs_components/1/edit
  def edit
    @blobs_component = BlobsComponent.find(params[:id])
  end

  # POST /blobs_components
  # POST /blobs_components.xml
  def create
    @blobs_component = BlobsComponent.new(params[:blobs_component])

    respond_to do |format|
      if @blobs_component.save
        flash[:notice] = 'BlobsComponent was successfully created.'
        format.html { redirect_to( edit_blobs_component_url(@blobs_component) ) }
        format.xml  { render :xml => @blobs_component, :status => :created, :location => @blobs_component }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @blobs_component.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /blobs_components/1
  # PUT /blobs_components/1.xml
  def update
    @blobs_component = BlobsComponent.find(params[:id])

    respond_to do |format|
      if @blobs_component.update_attributes(params[:blobs_component])
        flash[:notice] = 'BlobsComponent was successfully updated.'
        format.html { redirect_to(@blobs_component) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @blobs_component.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /blobs_components/1
  # DELETE /blobs_components/1.xml
  def destroy
    @blobs_component = BlobsComponent.find(params[:id])
    @blobs_component.destroy

    respond_to do |format|
      format.html { redirect_to(blobs_components_url) }
      format.xml  { head :ok }
    end
  end
end
