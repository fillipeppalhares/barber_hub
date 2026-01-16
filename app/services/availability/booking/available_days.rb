class Availability::Booking::AvailableDays
  attr_accessor :barber, :period, :duration
  private       :barber=, :period=, :duration=

  def self.call(barber:, period: nil, duration:)
    new(barber:, period:, duration:).call
  end

  def initialize(barber:, period: nil, duration:)
    self.barber = barber
    self.period = period
    self.duration = duration
  end

  def call
    period.range.select do |day|
      day >= Date.current && Availability::Booking::AvailableSlots.call(barber:, day:, duration:).any?
    end
  end
end
