include ComponentsHelper

class ComponentsController < ApplicationController
  # GET /components
  # GET /components.xml
  def index
    @search = Component.search( params[:search] )
    if( !params[:search] )
      @search = @search.order( "ascend_by_name" )
    end
    @components = @search.paginate( :page => params[:page], :per_page => 25 )

    for c in @components
      c.count = ComponentsHelper::stock_count( c, false )
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @components }
    end
  end

  # GET /components/1
  # GET /components/1.xml
  def show
    @component = Component.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @component }
    end
  end

  # GET /components/new
  # GET /components/new.xml
  def new
    @component = Component.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @component }
    end
  end

  # GET /components/1/edit
  def edit
    @component = Component.find(params[:id])
    @prizes = @component.prizes.sort_by{|p| [p.quantity]}
    @kicad_components = @component.kicad_components
    @component.count = ComponentsHelper::stock_count( @component, true )
    @project_components = @component.project_components

    for p in @prizes
      for o in p.orders
        if order_state(o)
          p.order = o
        end
      end
    end
  end

  # POST /components
  # POST /components.xml
  def create
    @component = Component.new(params[:component])

    respond_to do |format|
      if @component.save
        flash[:notice] = 'Component was successfully created.'
        format.html { redirect_to( edit_component_url(@component) ) }
        format.xml  { render :xml => @component, :status => :created, :location => @component }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @component.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /components/1
  # PUT /components/1.xml
  def update
    @component = Component.find(params[:id])

    respond_to do |format|
      if @component.update_attributes(params[:component])
        flash[:notice] = 'Component was successfully updated.'
        format.html { redirect_to(components_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @component.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /components/1
  # DELETE /components/1.xml
  def destroy
    @component = Component.find(params[:id])
    @component.destroy

    respond_to do |format|
      format.html { redirect_to(components_url) }
      format.xml  { head :ok }
    end
  end
end
