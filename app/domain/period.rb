class Period
  attr_reader :range

  class << self
    def current_month = new(Date.current.all_month)
    def current_week = new(Date.current.all_week)
    def next_month = new(Date.current.next_month.all_month)
    def next_week = new(Date.current.next_week.all_week)
    def current_and_next_month = new(Date.current.beginning_of_month..Date.current.next_month.end_of_month)
    def from_range(range) = new(range)
    def from_dates(start_date, end_date) = new(start_date..end_date)

    def from_param(param)
      case param
      when "current_month" then current_month
      when "current_week" then current_week
      when "next_month" then next_month
      when "next_week" then next_week
      when "current_and_next_month" then current_and_next_month
      else
        current_month
      end
    end
  end

  def initialize(range)
    @range = range
  end
end
