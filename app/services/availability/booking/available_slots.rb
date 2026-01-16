class Availability::Booking::AvailableSlots
  attr_accessor :gaps, :duration
  private       :gaps=, :duration=

  def self.call(barber:, day:, duration:)
    gaps = Availability::Agenda::Gaps.call(barber:, day:)
    new(gaps:, duration:).call
  end

  def initialize(gaps:, duration:)
    self.gaps = gaps
    self.duration = duration
  end

  def call
    gaps.flat_map do |gap|
      build_slots(gap)
    end
  end

  private

  def build_slots(gap)
    slots = []
    current = gap.begin

    while current + duration.minutes <= gap.end
      slots << current
      current += duration.minutes
    end

    slots
  end
end
