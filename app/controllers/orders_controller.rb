class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.xml
  def index
    local_orders = Order.all
    @orders = Array.new

    for o in local_orders
      if !@orders[o.order_state.id]
        @orders[o.order_state.id] = Hash.new
      end

      case o.order_state.name
      when 'needs'
        d = o.prize.supplier.name
      else
        d = o.prize.supplier.name + o.updated_at.strftime( "%d.%m.%Y" )
      end
      @orders[o.order_state.id][d] = o
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => orders }
    end
  end

  # GET /orders/list/1
  # GET /orders/list/1.xml
  def list
    local_orders = Order.find( :all, :order => 'order_state_id' )
    ref_order = Order.find( params[:id] )
    @orders = Array.new
    @sum = 0

    for o in local_orders
      if o.order_state.name == "needs" && ref_order.order_state.name == "needs"
        str = o.prize.supplier.name
        ref_str = ref_order.prize.supplier.name
      else
        str = o.prize.supplier.name + o.updated_at.strftime( "%d.%m.%Y" )
        ref_str = ref_order.prize.supplier.name + ref_order.updated_at.strftime( "%d.%m.%Y" )
      end

      if str == ref_str
        @orders << o
        @sum += o.prize.value * o.count
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.xml
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.xml
  def new
    @prize = Prize.find( params[:prize_id] )
    @prizes = Prize.find( :all, :conditions => {:component_id => @prize.component_id} )
    @order = Order.new
    @order.count = @prize.quantity

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @prize = Prize.find( params[:prize_id] )

    if( session[:all_orders] )
      @prizes = Prize.find( :all )
    else
      @prizes = Prize.find( :all, :conditions => {:component_id => @prize.component_id} )
    end

    @order = @prize.orders.find( params[:id] )
  end

  # POST /orders
  # POST /orders.xml
  def create
    prize = Prize.find( params[:prize_id] )
    @order = prize.orders.new( params[:order] )

    respond_to do |format|
      if @order.save
        flash[:notice] = 'Order was successfully created.'
        format.html { redirect_to(orders_path) }
        format.xml  { render :xml => @order, :status => :created, :location => @order }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.xml
  def update
    params[:all_orders].each do |item_id, val|
      if val == 'yes'
        session[:all_orders] = true
      else
        session[:all_orders] = false
      end
    end

    ActiveRecord::Base.record_timestamps = false
    @order = Order.find( params[:id] )
    date = DateTime.civil( params[:date][:"val(1i)"].to_i, params[:date][:"val(2i)"].to_i, params[:date][:"val(3i)"].to_i )

    respond_to do |format|
      if @order.update_attributes( params[:order] )
        if Order.update( @order, {:updated_at => date } )
          flash[:notice] = 'Order was successfully updated.'
          format.html { redirect_to(orders_path) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
        end
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.xml
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to(orders_url) }
      format.xml  { head :ok }
    end
  end
end
