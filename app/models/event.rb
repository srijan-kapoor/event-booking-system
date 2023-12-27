class Event < ApplicationRecord
  belongs_to :event_organizer
  has_many :tickets

  validates :name, presence: true, uniqueness: true
  validates :venue, presence: true

  accepts_nested_attributes_for :tickets, allow_destroy: true
end
