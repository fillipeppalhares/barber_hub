class Service < ApplicationRecord
  belongs_to :barber_shop
  has_many :schedules
end
