class OrdersController < ApplicationController
  def new
  end

  def create
    @order = Order.new order_params
    if @order.save
      flash[:success] = "Your order succsessfully created!"
      redirect_to products_path
    else
      redirect_to cart_path
    end
  end

  private

  def order_params
    params.require(:order).permit(:total_sum, :user_id)
  end 
end
