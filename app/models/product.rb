class Product < ApplicationRecord
  belongs_to :category
  has_many :order_items

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
  validates :available, presence: true
end
