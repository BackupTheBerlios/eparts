class ProjectComponentsController < ApplicationController
  # GET /project_components
  # GET /project_components.xml
  def index
    @project_components = ProjectComponent.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @project_components }
    end
  end

  # GET /project_components/1
  # GET /project_components/1.xml
  def show
    @project_component = ProjectComponent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @project_component }
    end
  end

  # GET /project_components/new
  # GET /project_components/new.xml
  def new
    @project = Project.find( params[:project_id] )
    @project_component = @project.project_components.new
    if params[:component_id]
      @project_component.component = Component.find( params[:component_id] )
    end
    if params[:count]
      @project_component.count = params[:count]
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project_component }
    end
  end

  # GET /project_components/1/edit
  def edit
    @project = Project.find( params[:project_id] )
    @project_component = @project.project_components.find(params[:id])
  end

  # POST /project_components
  # POST /project_components.xml
  def create
    project = Project.find( params[:project_id] )
    @project_component = project.project_components.new(params[:project_component])

    respond_to do |format|
      if @project_component.save
        flash[:notice] = 'ProjectComponent was successfully created.'
        format.html { redirect_to( edit_project_url(project) ) }
        format.xml  { render :xml => @project_component, :status => :created, :location => @project_component }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project_component.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /project_components/1
  # PUT /project_components/1.xml
  def update
    project = Project.find( params[:project_id] )
    @project_component = project.project_components.find(params[:id])

    respond_to do |format|
      if @project_component.update_attributes(params[:project_component])
        flash[:notice] = 'ProjectComponent was successfully updated.'
        format.html { redirect_to( edit_project_url(project) ) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project_component.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /project_components/1
  # DELETE /project_components/1.xml
  def destroy
    @project_component = ProjectComponent.find(params[:id])
    @project_component.destroy

    respond_to do |format|
      format.html { redirect_to(project_components_url) }
      format.xml  { head :ok }
    end
  end
end
