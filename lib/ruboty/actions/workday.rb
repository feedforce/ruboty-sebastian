require 'holiday_jp'

module Workday
  def workday?
  end

  def first_of_year
    first = Date.new(date.year, 1, 5)

    first_day = 7 if first.sunday?
    first_day = 6 if first.saturday?
    first_day ||= 5
  end

  def last_of_year
    last = Date.new(date.year, 12, 29)

    last_day = 27 if last.sunday?
    last_day = 28 if last.saturday?
    last_day ||= 29
  end

  def first_of_year?
    date.month == 1 && date.day == first_of_year
  end

  def last_of_year?
    date.month == 12 && date.day == last_of_year
  end

  def new_year_holiday?
  end

  def date
    @date = Date.now
  end
end
