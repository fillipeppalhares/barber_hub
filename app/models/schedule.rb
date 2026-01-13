class Schedule < ApplicationRecord
  scope :active, -> { where(active: true) }
  scope :ordered, -> { order(:weekday, :start_time) }

  belongs_to :barber

  has_enumeration_for :weekday, with: Weekdays, create_helpers: { prefix: true }

  def self.grouped_by_weekday
    active.ordered.group_by(&:weekday)
  end
end
