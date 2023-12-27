class Ticket < ApplicationRecord
  belongs_to :event
  has_many :bookings

  validates :type, uniqueness: { scope: [:type, :event_id] }
end
