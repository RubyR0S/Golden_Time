module Admin  
  class OrdersController < ApplicationController
    before_action :set_order, only: %i[edit update]
    before_action :user_admin?

    def list_of_ordered_products
      @order_id = params[:order_id]
      @ordered_products = Order.find(@order_id).product_items
    end

    # def destroy
    #   @order_id = params[:order_id]
    #   order = Order.find(@order_id)
    #   product_item = order.product_items.find_by(id: params[:id])
    #   product_item.destroy
    #   redirect_to list_of_ordered_products_admin_order_path(@order_id)
    # end

    # def destroy
    #   order = Order.find(params[:order_id])
    #   product_item = order.product_items.find_by(id: params[:id])
    #   product_item.destroy
    #   redirect_to list_of_ordered_products_admin_order_path(order_id: order.id)
    # end

    def destroy
      @ordered_product = ProductItem.find(params[:id])
      @ordered_product.destroy
      redirect_to admin_orders_path
    end

    def index
      @orders = Order.order(created_at: :desc)
    end

    def edit
    end

    def update
      if @order.update order_params
        flash[:success] = 'Users order succsessfully updated!'
        redirect_to admin_orders_path
      else
        render :edit
      end
    end

    private

    def set_order
      @order = Order.find(params[:id]) 
    end

    def order_params
      params.require(:order).permit(:first_name, :last_name, :phone_number, :address, :pay_type)
    end
  end
end