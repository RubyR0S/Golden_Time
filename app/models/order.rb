class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items, source: :product
  belongs_to :user
  before_save :set_total_sum

  def total_sum
    order_items.collect { |order_item| order_item.valid? ? order_item.unit_price * order_item.quantity : 0 }.sum
  end

  private

  def set_total_sum
    self[:total_sum] = total_sum
  end
end
