class ProductItemsController < ApplicationController
  before_action :require_current_user

  def new
  end

  def create
    @cart = current_cart
    @order = current_order
    product = Product.find(params[:product_item][:product_id])
    @product_item = @cart.add_product(product.id, params[:product_item][:quantity].to_i)

    respond_to do |format|
      if @product_item.save
        format.html { redirect_to products_path }
        format.js { @current_item = @product_item }
        format.any { render plain: 'OK' } # fallback format
      else
        format.html { render :new }
        format.js { render json: @product_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @cart = current_cart
    @product_item = @cart.product_items.find(params[:id])
    # @product_item.update_attributes(product_item_params)


    respond_to do |format|
      if @product_item.update_attributes(product_item_params)
        format.html
        format.js
      end
    end
  end

  def destroy
    @cart = current_cart
    @product_item = @cart.product_items.find(params[:id])
    @product_item.destroy
    redirect_to products_path
  end

  private

  def product_item_params
    params.require(:product_item).permit(:product_id, :quantity)
  end
end