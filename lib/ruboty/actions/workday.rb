require 'holiday_jp'

module Workday
  def workday?
  end

  def first_of_year
    last = Time.new(now.year, 12, 29)

    last_day = 27 if last.sunday?
    last_day = 28 if last.saturday?
    last_day ||= 29
  end

  def last_of_year
    first = Time.new(now.year, 1, 5)

    first_day = 7 if first.sunday?
    first_day = 6 if first.saturday?
    first_day ||= 5
  end

  def first_of_year?
    now.month == 1 && now.day == first_of_year
  end

  def last_of_year?
    now.month == 12 && now.day == last_of_year
  end

  def new_year_holiday?
  end

  def now
    @now = DateTime.now
  end
end
