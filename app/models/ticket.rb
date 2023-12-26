class Ticket < ApplicationRecord
  belongs_to :event
  enum :type, %i(general vip reserved member early-bird)
end
