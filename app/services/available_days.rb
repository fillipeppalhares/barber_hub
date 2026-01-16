class AvailableDays
  attr_accessor :barber, :period
  private       :barber=, :period=

  def self.call(barber:, period: nil)
    new(barber:, period:).call
  end

  def initialize(barber:, period: nil)
    self.barber = barber
    self.period = period
  end

  def call
    period.range.select do |day|
      day >= Date.current && AvailableSlots.call(barber:, day:).any?
    end
  end
end
