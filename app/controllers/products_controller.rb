class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  def index
    if params[:category_id].present?
      @category = Category.find(params[:category_id])
      @products = @category.products.where(available: true)
    else
      @products = Product.where(available: true)
    end
    
    @cart = current_cart
    @categories = Category.all

    @products = @products.where(category_id: params[:category_id])                                                   if params[:category_id].present?
    @products = @products.where("name LIKE ? or description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
    @products = @products.where("price >= ?", params[:price_from])                                                   if params[:price_from].present?
    @products = @products.where("price <= ?", params[:price_to])                                                     if params[:price_to].present?
    @price_from = params[:price_from]
    @price_to = params[:price_to]
    @search = params[:search]
    @category_id = params[:category_id]
    @products
  end

  def show
    @product = Product.find(params[:id])
  end
end
