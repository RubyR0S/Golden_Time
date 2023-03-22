class User < ApplicationRecord
  enum role: { basic: 0, admin: 1 }, _suffix: :role
  has_secure_password
  has_many :orders

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true, length: { maximum: 255 }, 
  format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i },
  uniqueness: true
  validates :password, confirmation: true,
  length: { minimum: 6, maximum: 50 }
end