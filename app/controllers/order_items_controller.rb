class OrderItemsController < ApplicationController
  before_action :set_order
  def create
    @order_item = @order.order_items.new(order_params)
    @order.user_id = current_user.id
    @order.save
    session[:order_id] = @order.id
  end

  # def update
  #   @order_item = @order.order_items.find(params[:id])
  #   @order_item.update_attributes(order_params)
  #   @order_items = current_order.order_items
  # end

  def destroy
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = current_order.order_items
    redirect_to cart_path
  end

  def create_final_order
    @user = current_user
    @order_items = current_order.order_items

  end

  private

  def order_params
    params.require(:order_item).permit(:quantity, :product_id, :total_sum)
  end

  def set_order
    @order = current_order
  end
end
