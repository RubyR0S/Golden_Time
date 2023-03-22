class CartsController < ApplicationController
  def show
    @cart = current_cart
  end

  # def show
  #   @product_items = current_cart.product_items
  # end

  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil
    flash[:success] = 'Your cart is currently empty'
    redirect_to products_url
  end
end