#require 'gettext/rails'

include ComponentsHelper

class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.xml
  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.xml
  def show
    @project = Project.find( params[:id] )

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.xml
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find( params[:id] )
    @project_components = ProjectComponent.find( :all, :conditions => {:project_id => @project} )
  end

  def list_components
    @project = Project.find( params[:id] )
    @project_components = @project.project_components.sort_by{|c| [c.component.name]}

    @kicad_components = KicadComponent.new.read( %Q{#{@project.path}/#{@project.name}.cmp} )

    for pc in @project_components do
      pc.consider_count = pc.count
      for kc in pc.component.kicad_components
        kc_file = @kicad_components[kc.name + kc.kicad_housing.name]
        if kc_file
          if kc.name == kc_file.name
            pc.consider_count -= kc_file.count
            kc_file.count = 0
          end
        end
      end

      pc.component_count = ComponentsHelper::stock_count( pc.component, true )
    end

    components = Component.find( :all )
    for c in components
      @kicad_components.each do |id, kc_file|
        for kcc in c.kicad_components
          if kc_file.name == kcc.name && kc_file.housing == kcc.kicad_housing.name
            kc_file.assign = c
          end
        end
      end
    end
  end

  def assign
    list_components

    redirect_to( :controller => :projects, :action => :list_components, :id => params[:id] )
  end

  # POST /projects
  # POST /projects.xml
  def create
    @project = Project.new( params[:project] )

    respond_to do |format|
      if @project.save
        flash[:notice] = 'Project was successfully created.'
        format.html { redirect_to(projects_url) }
        format.xml  { render :xml => @project, :status => :created, :location => @project }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.xml
  def update
    @project = Project.find( params[:id] )

    respond_to do |format|
      if @project.update_attributes(params[:project])
        flash[:notice] = 'Project was successfully updated.'
        format.html { redirect_to(projects_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.xml
  def destroy
    @project = Project.find( params[:id] )
    @project.destroy

    respond_to do |format|
      format.html { redirect_to(projects_url) }
      format.xml  { head :ok }
    end
  end
end
