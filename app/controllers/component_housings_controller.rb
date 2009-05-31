class ComponentHousingsController < ApplicationController
  # GET /component_housings
  # GET /component_housings.xml
  def index
    @component_housings = ComponentHousing.find( :all, :order => 'name' )

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @component_housings }
    end
  end

  # GET /component_housings/1
  # GET /component_housings/1.xml
  def show
    @component_housing = ComponentHousing.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @component_housing }
    end
  end

  # GET /component_housings/new
  # GET /component_housings/new.xml
  def new
    @component_housing = ComponentHousing.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @component_housing }
    end
  end

  # GET /component_housings/1/edit
  def edit
    @component_housing = ComponentHousing.find(params[:id])
  end

  # POST /component_housings
  # POST /component_housings.xml
  def create
    @component_housing = ComponentHousing.new( params[:component_housing] )

    respond_to do |format|
      if @component_housing.save
        flash[:notice] = 'ComponentHousing was successfully created.'
        format.html { redirect_to(component_housings_url) }
        format.xml  { render :xml => @component_housing, :status => :created, :location => @component_housing }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @component_housing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /component_housings/1
  # PUT /component_housings/1.xml
  def update
    @component_housing = ComponentHousing.find(params[:id])

    respond_to do |format|
      if @component_housing.update_attributes(params[:component_housing])
        flash[:notice] = 'ComponentHousing was successfully updated.'
        format.html { redirect_to(component_housings_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @component_housing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /component_housings/1
  # DELETE /component_housings/1.xml
  def destroy
    @component_housing = ComponentHousing.find(params[:id])
    @component_housing.destroy

    respond_to do |format|
      format.html { redirect_to(component_housings_url) }
      format.xml  { head :ok }
    end
  end
end
