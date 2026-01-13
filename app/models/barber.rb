class Barber < ApplicationRecord
  belongs_to :barber_shop
  has_many :appointments
  has_many :schedules
end
