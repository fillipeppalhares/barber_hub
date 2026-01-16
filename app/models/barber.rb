class Barber < ApplicationRecord
  belongs_to :barber_shop
  has_many :appointments
  has_many :schedules

  accepts_nested_attributes_for :schedules

  after_create_commit :build_weekly_schedule

  def available_days(period: Period.current_month)
    AvailableDays.call(barber: self, period:)
  end

  def available_slots(day:)
    AvailableSlots.call(barber: self, day:)
  end

  private

  def build_weekly_schedule
    return false if schedules.present?

    Weekdays.list.each do |day_number|
      schedules.build(weekday: day_number, start_time: "08:00", end_time: "12:00", active: true)
      schedules.build(weekday: day_number, start_time: "13:00", end_time: "18:00", active: true)
    end

    save!
  end
end
