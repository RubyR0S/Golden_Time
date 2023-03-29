module Admin  
  class OrdersController < ApplicationController
     before_action :set_order, only: %i[edit update]
 
 
     def list_of_ordered_products
       order_id = params[:order_id]
       @ordered_products = Order.find(order_id).product_items
     end
 
     def index
       @orders = Order.order(created_at: :desc)
     end
 
     def edit
     end
 
     def update
       @order = Order.find(params[:id])
 
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