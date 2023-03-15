class FinalOrder < ApplicationRecord
  has_many :final_order_products, dependent: :destroy
  has_many :products, through: :final_order_products
  belongs_to :user

  validates :first_name, :last_name, :phone_number, :address, presence: true

end
