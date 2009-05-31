class OrderStatesController < ApplicationController
  # GET /order_states
  # GET /order_states.xml
  def index
    @order_states = OrderState.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @order_states }
    end
  end

  # GET /order_states/1
  # GET /order_states/1.xml
  def show
    @order_state = OrderState.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order_state }
    end
  end

  # GET /order_states/new
  # GET /order_states/new.xml
  def new
    @order_state = OrderState.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @order_state }
    end
  end

  # GET /order_states/1/edit
  def edit
    @order_state = OrderState.find(params[:id])
  end

  # POST /order_states
  # POST /order_states.xml
  def create
    @order_state = OrderState.new( params[:order_state] )

    respond_to do |format|
      if @order_state.save
        flash[:notice] = 'OrderState was successfully created.'
        format.html { redirect_to(order_states_url) }
        format.xml  { render :xml => @order_state, :status => :created, :location => @order_state }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @order_state.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /order_states/1
  # PUT /order_states/1.xml
  def update
    @order_state = OrderState.find( params[:id] )

    respond_to do |format|
      if @order_state.update_attributes(params[:order_state])
        flash[:notice] = 'OrderState was successfully updated.'
        format.html { redirect_to(order_states_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @order_state.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /order_states/1
  # DELETE /order_states/1.xml
  def destroy
    @order_state = OrderState.find(params[:id])
    @order_state.destroy

    respond_to do |format|
      format.html { redirect_to(order_states_url) }
      format.xml  { head :ok }
    end
  end
end
