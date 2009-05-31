class ProjectStatesController < ApplicationController
  # GET /project_states
  # GET /project_states.xml
  def index
    @project_states = ProjectState.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @project_states }
    end
  end

  # GET /project_states/1
  # GET /project_states/1.xml
  def show
    @project_state = ProjectState.find( params[:id] )

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @project_state }
    end
  end

  # GET /project_states/new
  # GET /project_states/new.xml
  def new
    @project_state = ProjectState.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project_state }
    end
  end

  # GET /project_states/1/edit
  def edit
    @project_state = ProjectState.find( params[:id] )
  end

  # POST /project_states
  # POST /project_states.xml
  def create
    @project_state = ProjectState.new( params[:project_state] )

    respond_to do |format|
      if @project_state.save
        flash[:notice] = 'ProjectState was successfully created.'
        format.html { redirect_to(project_states_url) }
        format.xml  { render :xml => @project_state, :status => :created, :location => @project_state }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project_state.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /project_states/1
  # PUT /project_states/1.xml
  def update
    @project_state = ProjectState.find( params[:id] )

    respond_to do |format|
      if @project_state.update_attributes( params[:project_state] )
        flash[:notice] = 'ProjectState was successfully updated.'
        format.html { redirect_to(project_states_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project_state.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /project_states/1
  # DELETE /project_states/1.xml
  def destroy
    @project_state = ProjectState.find( params[:id] )
    @project_state.destroy

    respond_to do |format|
      format.html { redirect_to(project_states_url) }
      format.xml  { head :ok }
    end
  end
end
