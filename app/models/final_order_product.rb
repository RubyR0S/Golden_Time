class FinalOrderProduct < ApplicationRecord
  belongs_to :final_order
  belongs_to :product
  # before_save :set_quantity

  # def quantity
  #   order_items.quantity.to_i.where(product_id: current_order.order_items.product.id)
  # end

  # private

  # def set_quantity
  #   self[:quantity] = quantity
  # end
end
