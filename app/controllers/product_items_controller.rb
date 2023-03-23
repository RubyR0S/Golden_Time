class ProductItemsController < ApplicationController

  def new
  end

  def create
    @cart = current_cart
    @order = current_order
    product = Product.find(params[:product_id])
    @product_item = @cart.add_product(product.id)
    # @order.user_id = current_user.id

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

  def destroy
    @cart = current_cart
    @product_item = @cart.product_items.find(params[:id])
    @product_item.destroy
    redirect_to products_url
  end

  private

  # def product_item_params
  #   params.require(:line_item).permit(:product_id)
  # end
end