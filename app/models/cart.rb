class Cart < ApplicationRecord
  has_many :product_items, dependent: :destroy
  has_many :products, through: :product_items, source: :product

  def add_product(product_id, quantity)
    current_item = product_items.find_by_product_id(product_id)
        if current_item
          current_item.quantity += quantity.to_i
        else
          current_item = product_items.build(product_id: product_id, quantity: quantity)
        end

    current_item
  end

  def total_price
    product_items.to_a.sum { |item| item.total_price }
  end
end
