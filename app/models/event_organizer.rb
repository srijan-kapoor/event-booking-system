class EventOrganizer < ApplicationRecord
  has_secure_password
  has_many :events

  validates_presence_of :email
  validates :email, uniqueness: true
end
