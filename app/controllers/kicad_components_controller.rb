class KicadComponentsController < ApplicationController
  # GET /kicad_components
  # GET /kicad_components.xml
  def index
    @kicad_components = KicadComponent.find( :all, :order => :name )

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @kicad_components }
    end
  end

  # GET /kicad_components/1
  # GET /kicad_components/1.xml
  def show
    @kicad_component = KicadComponent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @kicad_component }
    end
  end

  # GET /kicad_components/new
  # GET /kicad_components/new.xml
  def new
    @kicad_component = KicadComponent.new

    if params[:component_id]
      component = Component.find( params[:component_id] )
    end
    @kicad_component.component = component

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @kicad_component }
    end
  end

  # GET /kicad_components/1/edit
  def edit
    @kicad_component = KicadComponent.find(params[:id])
  end

  # POST /kicad_components
  # POST /kicad_components.xml
  def create
    @kicad_component = KicadComponent.new( params[:kicad_component] )

    respond_to do |format|
      if @kicad_component.save
        flash[:notice] = 'KicadComponent was successfully created.'
        format.html { redirect_to(kicad_components_url) }
        format.xml  { render :xml => @kicad_component, :status => :created, :location => @kicad_component }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @kicad_component.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /kicad_components/1
  # PUT /kicad_components/1.xml
  def update
    @kicad_component = KicadComponent.find( params[:id] )

    respond_to do |format|
      if @kicad_component.update_attributes(params[:kicad_component])
        flash[:notice] = 'KicadComponent was successfully updated.'
        format.html { redirect_to(kicad_components_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @kicad_component.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /kicad_components/1
  # DELETE /kicad_components/1.xml
  def destroy
    @kicad_component = KicadComponent.find(params[:id])
    @kicad_component.destroy

    respond_to do |format|
      format.html { redirect_to(kicad_components_url) }
      format.xml  { head :ok }
    end
  end
end
