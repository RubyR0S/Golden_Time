class Order < ApplicationRecord
  # has_many :order_items, dependent: :destroy
  # has_many :products, through: :order_items, source: :product
  PAYMENT_TYPES = [ "Check", "Credit card", "Payment upon receipt" ]
  belongs_to :user
  has_many :product_items, dependent: :destroy
  # before_save :set_total_sum
  validates :first_name, :last_name, :phone_number, :address,  presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES 

  


  # def total_sum
  #   order_items.collect { |order_item| order_item.valid? ? order_item.unit_price * order_item.quantity : 0 }.sum
  # end

  # private

  # def set_total_sum
  #   self[:total_sum] = total_sum
  # end

  def add_product_items_from_cart(cart)
    cart.product_items.each do |item|
      item.cart_id = nil
      product_items << item
    end
  end

  def total_sum
    product_items.to_a.sum { |item| item.total_sum }
  end
end
