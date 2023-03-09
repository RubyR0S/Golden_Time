class Product < ApplicationRecord
  belongs_to :category

  def self.search(params)
    products = Product.all
    products = products.where(category_id: params[:category_id]) if params[:category_id].present?
    # products = products.where("category_id LIKE ?", params[:category_id]) if params[:category_id].present?
    products = products.where("name LIKE ? or description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
    products = products.where("price >= ?", params[:price_from]) if params[:price_from].present?
    products = products.where("price <= ?", params[:price_to]) if params[:price_to].present?
    products
  end
  
end
