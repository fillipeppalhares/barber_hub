class BarberShop < ApplicationRecord
  has_many :barbers
  has_many :services
end
