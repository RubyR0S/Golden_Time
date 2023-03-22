# class FinalOrdersController < ApplicationController
#   def new
#     @final_order = FinalOrder.new(
#       user: current_user,
#       first_name: current_user.first_name,
#       last_name: current_user.last_name,
#       phone_number: current_user.phone_number,
#       address: current_user.address
#     )

#     @order_items = current_order.order_items
#   end

#   def create
#     @order_items = current_order.order_items

#     @final_order = FinalOrder.new(final_order_params)
#     @final_order.user = current_user
#     @final_order.products = Product.where(id: params[:product_ids].split(','))
#     @final_order.total_sum = current_order.total_sum
#     if @final_order.save
#       current_order.destroy
#       flash[:success] = "Thank you for order!"
#       redirect_to products_path
#     else
#       render 'new'
#     end
#   end

#   private

#   def final_order_params
#     params.require(:final_order).permit(:address, :phone_number, :last_name, :first_name)
#   end 
# end
