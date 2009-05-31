class KicadHousingsController < ApplicationController
  # GET /kicad_housings
  # GET /kicad_housings.xml
  def index
    @kicad_housings = KicadHousing.find( :all, :order => 'name' )

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @kicad_housings }
    end
  end

  # GET /kicad_housings/1
  # GET /kicad_housings/1.xml
  def show
    @kicad_housing = KicadHousing.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @kicad_housing }
    end
  end

  # GET /kicad_housings/new
  # GET /kicad_housings/new.xml
  def new
    @kicad_housing = KicadHousing.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @kicad_housing }
    end
  end

  # GET /kicad_housings/1/edit
  def edit
    @kicad_housing = KicadHousing.find(params[:id])
  end

  # POST /kicad_housings
  # POST /kicad_housings.xml
  def create
    @kicad_housing = KicadHousing.new(params[:kicad_housing])

    respond_to do |format|
      if @kicad_housing.save
        flash[:notice] = 'KicadHousing was successfully created.'
        format.html { redirect_to(kicad_housings_url) }
        format.xml  { render :xml => @kicad_housing, :status => :created, :location => @kicad_housing }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @kicad_housing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /kicad_housings/1
  # PUT /kicad_housings/1.xml
  def update
    @kicad_housing = KicadHousing.find(params[:id])

    respond_to do |format|
      if @kicad_housing.update_attributes(params[:kicad_housing])
        flash[:notice] = 'KicadHousing was successfully updated.'
        format.html { redirect_to(kicad_housings_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @kicad_housing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /kicad_housings/1
  # DELETE /kicad_housings/1.xml
  def destroy
    @kicad_housing = KicadHousing.find(params[:id])
    @kicad_housing.destroy

    respond_to do |format|
      format.html { redirect_to(kicad_housings_url) }
      format.xml  { head :ok }
    end
  end
end
