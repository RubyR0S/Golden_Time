class Order < ApplicationRecord
  # has_many :order_items, dependent: :destroy
  # has_many :products, through: :order_items, source: :product
  PAYMENT_TYPES = [ "Check", "Credit card", "Payment upon receipt" ]
  belongs_to :user
  has_many :product_items, dependent: :destroy
  validates :first_name, :last_name, :phone_number, :address,  presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES 

  before_save :set_total_sum

  def add_product_items_from_cart(cart)
    cart.product_items.each do |item|
      item.cart_id = nil
      product_items << item
    end
  end

  def total_sum
    product_items.to_a.sum { |item| item.total_price }
  end
  
  # def total_sum
  #   product.price * quantity
  # end

  # def total_sum
  #   product_items.collect { |product_item| product_item.valid? ? product.price * quantity : 0 }.sum
  # end

  private

  def set_total_sum
    self[:total_sum] = total_sum
  end



  # def total_sum
  #   product_items.to_a.sum { |item| item.total_sum }
  # end
end
