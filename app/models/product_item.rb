class ProductItem < ApplicationRecord
  # belongs_to :order
  belongs_to :product
  belongs_to :cart
 
  def total_price
    product.price * quantity
  end

end
