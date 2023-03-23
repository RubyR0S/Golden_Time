class OrdersController < ApplicationController
  # before_action :set_order

  # def index
  #   @orders = Order.all
  # end

  def new
    @cart = current_cart
    if @cart.product_items.empty?
      redirect_to products_url
     
    end

   @order = Order.new
    respond_to do |format|
    format.html # new.html.erb
    format.json { render json: @order } 
   end
  end
    
  #   # (
  #   #         user: current_user,
  #   #         first_name: current_user.first_name,
  #   #         last_name: current_user.last_name,
  #   #         phone_number: current_user.phone_number,
  #   #         address: current_user.address
  #   #       )
  # end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @cart = current_cart
    @order.add_product_items_from_cart(current_cart)


    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      flash[:success] = "Thank you for your order."
      redirect_to products_url # notice: "Thank you for your order."
    else
      @cart = current_cart
      render action: "new"
    end
  end

  private

  # def set_order
  #   @order = Order.find(params[:id]) ||  @order = Order.new(user: current_user)
  # end

  def order_params
    params.require(:order).permit(:first_name, :last_name, :phone_number, :address, :pay_type)
  end
end
