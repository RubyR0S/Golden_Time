class Product < ApplicationRecord
  # has_many :order_items
  belongs_to :category
  has_many :product_items
  has_many :orders, through: :product_items
  before_destroy :ensure_not_referenced_by_any_product_item



  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
  validates :available, presence: true

  private

  def ensure_not_referenced_by_any_product_item
    if product_items.empty?
      return true
    else
      errors.add(:base, 'Exist product items!')
      return false
    end
  end
end
