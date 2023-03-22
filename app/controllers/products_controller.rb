class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  def index
    @products = Product.where(available: true)
    @cart = current_cart
    # @order_item = current_order.order_items.new

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
