class PrizesController < ApplicationController
  # GET /components/:component_id/prizes
  # GET /components/:component_id/prizes.xml
  def index
    component = Component.find( params[:component_id] )
    @prizes = component.prizes.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @prizes }
    end
  end

  # GET /prizes/1
  # GET /prizes/1.xml
  def show
    @prize = Prize.find( params[:id] )

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @prize }
    end
  end

  # GET /components/:component_id/prizes/new
  # GET /components/:component_id/prizes/new.xml
  def new
    @component = Component.find( params[:component_id] )
    @prize = @component.prizes.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @prize }
    end
  end

  # GET /components/:component_id/prizes/1/edit
  def edit
    @component = Component.find( params[:component_id] )
    @prize = @component.prizes.find( params[:id] )
    @prize.end = Time.new
  end

  # POST /components/:component_id/prizes
  # POST /components/:component_id/prizes.xml
  def create
    component = Component.find( params[:component_id] )
    @prize = component.prizes.new( params[:prize] )

    respond_to do |format|
      if @prize.save
        flash[:notice] = 'Prize was successfully created.'
        if @prize.begin > @prize.end
          @prize.begin = @prize.end
          @prize.save
          flash[:notice] << ' Startdatum wurde angeglichen.'
        end
        format.html { redirect_to( edit_component_url(component) ) }
        format.xml  { render :xml => @prize, :status => :created, :location => @prize }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @prize.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /components/:component_id/prizes/1
  # PUT /components/:component_id/prizes/1.xml
  def update
    component = Component.find( params[:component_id] )
    @prize = component.prizes.find( params[:id] )

    respond_to do |format|
      if @prize.update_attributes( params[:prize] )
        flash[:notice] = 'Prize was successfully updated.'
        if @prize.begin > @prize.end
          @prize.begin = @prize.end
          @prize.save
          flash[:notice] << ' Startdatum wurde angeglichen.'
        end
        format.html { redirect_to(edit_component_url(component)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @prize.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /prizes/1
  # DELETE /prizes/1.xml
  def destroy
    @prize = Prize.find(params[:id])
    @prize.destroy

    respond_to do |format|
      format.html { redirect_to(prizes_url) }
      format.xml  { head :ok }
    end
  end
end
