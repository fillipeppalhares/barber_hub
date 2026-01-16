class AvailableSlots
  attr_accessor :barber, :day, :gaps
  private       :barber=, :day=, :gaps=

  def self.call(barber:, day: nil)
    new(barber:, day:).call
  end

  def initialize(barber:, day: nil)
    self.barber = barber
    self.day = day
    self.gaps = []
  end

  def call
    schedules = barber.schedules.where(weekday: day.wday)
    appointments = day_appointments

    schedules.each do |schedule|
      journey_start = journey_start_at(schedule)
      journey_end   = journey_end_at(schedule)

      cursor = journey_start

      appointments.each do |appt|
        start_at = [appt.start_at, journey_start].max
        end_at   = [appt.end_at, journey_end].min

        next if end_at <= journey_start || start_at >= journey_end

        gaps << (cursor...start_at) if start_at > cursor
        cursor = [cursor, end_at].max
      end

      gaps << (cursor...journey_end) if cursor < journey_end
    end

    gaps
  end

  private

  def day_appointments
    barber.appointments.where(start_at: day.all_day).order(:start_at)
  end

  def journey_start_at(schedule)
    Time.zone.local(day.year, day.month, day.day, schedule.start_time.hour, schedule.start_time.min)
  end

  def journey_end_at(schedule)
    Time.zone.local(day.year, day.month, day.day, schedule.end_time.hour, schedule.end_time.min)
  end
end
