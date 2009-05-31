class ComponentCategoriesController < ApplicationController
  # GET /component_categories
  # GET /component_categories.xml
  def index
    @component_categories = ComponentCategory.find( :all, :order => 'name' )

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @component_categories }
    end
  end

  # GET /component_categories/1
  # GET /component_categories/1.xml
  def show
    @component_category = ComponentCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @component_category }
    end
  end

  # GET /component_categories/new
  # GET /component_categories/new.xml
  def new
    @component_category = ComponentCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @component_category }
    end
  end

  # GET /component_categories/1/edit
  def edit
    @component_category = ComponentCategory.find(params[:id])
  end

  # POST /component_categories
  # POST /component_categories.xml
  def create
    @component_category = ComponentCategory.new(params[:component_category])

    respond_to do |format|
      if @component_category.save
        flash[:notice] = 'ComponentCategory was successfully created.'
        format.html { redirect_to(component_categories_url) }
        format.xml  { render :xml => @component_category, :status => :created, :location => @component_category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @component_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /component_categories/1
  # PUT /component_categories/1.xml
  def update
    @component_category = ComponentCategory.find(params[:id])

    respond_to do |format|
      if @component_category.update_attributes(params[:component_category])
        flash[:notice] = 'ComponentCategory was successfully updated.'
        format.html { redirect_to(component_categories_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @component_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /component_categories/1
  # DELETE /component_categories/1.xml
  def destroy
    @component_category = ComponentCategory.find(params[:id])
    @component_category.destroy

    respond_to do |format|
      format.html { redirect_to(component_categories_url) }
      format.xml  { head :ok }
    end
  end
end
