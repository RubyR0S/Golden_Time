module Admin
  class ProductsController < ApplicationController
    before_action :set_product, only: %i[ show edit update destroy ]
    before_action :user_admin?

    def index
      @products = Product.all
    end

    def new
      @product = Product.new
    end

    def create 
      @product = Product.new product_params
      if @product.save
        flash[:success] = 'Product succsessfully created!'
        redirect_to admin_products_path
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @product.update product_params
        flash[:success] = 'Product succsessfully updated!'
        redirect_to admin_products_path
      else
        render :edit
      end
    end

    def destroy
      @product.destroy
      flash[:success] = 'Product succsessfully deleted!'
      redirect_to admin_products_path
    end

    private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :price, :category_id, :available)
    end
  end
end
