# frozen_string_literal: true

require_relative 'calculation'

# Class for yearly weather report
class WeatherByYear
  include BasicCalculations
  include WeatherCalculations

  def initialize(year)
    @year = year
    @max_temp = 0
    @max_temp_day = 0
    @max_temp_month = 0

    @min_temp = 0
    @min_temp_day = 0
    @min_temp_month = 0

    @max_humidity = 0
    @max_humidity_day = 0
    @max_humidity_month = 0
  end

  # Calculate highest temperature and day
  def max_temp
    @max_temp, @max_temp_day, @max_temp_month = calc_max(1)
    puts "Highest: #{@max_temp}C on #{@max_temp_month} #{@max_temp_day}"
  end

  # Calculate lowest temperature and day
  def min_temp
    @min_temp, @min_temp_day, @min_temp_month = calc_min(3)
    puts "Lowest:  #{@min_temp}C on #{@min_temp_month} #{@min_temp_day}"
  end

  # Calculate highest humidity and day
  def max_humidity
    @max_humidity, @max_humidity_day, @max_humidity_month = calc_max(7)
    puts "Humid:   #{@max_humidity}% on #{@max_humidity_month} #{@max_humidity_day}"
  end
end
