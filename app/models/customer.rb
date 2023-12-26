class Customer < ApplicationRecord
  has_secure_password

  validates_presence_of :email
  validates :email, uniqueness: true
end
