class User < ApplicationRecord
  has_secure_password
  
  validates :email, presence: true, length: { maximum: 255 }, 
  format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i },
  uniqueness: true
  validates :password, confirmation: true, allow_blank: true,
  length: { minimum: 6, maximum: 50 }
end
