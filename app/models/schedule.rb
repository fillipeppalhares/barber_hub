class Schedule < ApplicationRecord
  belongs_to :barber
  has_enumeration_for :weekday, with: Weekdays, create_helpers: { prefix: true }
end
