class Listing < ApplicationRecord
  has_many :bookings, dependent: :destroy
  serialize :amenities, type: Array, coder: JSON
end
