# frozen_string_literal: true

require File.expand_path('./weatherbymonth.rb', __dir__)
require File.expand_path('./weatherbyyear.rb', __dir__)
require File.expand_path('./weatherchart.rb', __dir__)

# Weatherman Driver class
class Weatherman
  # Option: -e
  def weather_by_year(year)
    weather_by_year = WeatherByYear.new(year)
    weather_by_year.max_temp
    weather_by_year.min_temp
    weather_by_year.max_humidity
  end

  # Option: -a
  def weather_by_month
    weather_by_month = WeatherByMonth.new
    weather_by_month.high_avg_temp
    weather_by_month.low_avg_temp
    weather_by_month.avg_humidity
  end

  # Option: -c
  def weather_chart
    weather_chart = WeatherChart.new
    weather_chart.display_chart
  end
end

# Switch case by input command
option = ARGV[0]

case option

when '-e'
  Weatherman.new.weather_by_year(ARGV[1])

when '-a'
  Weatherman.new.weather_by_month

when '-c'
  Weatherman.new.weather_chart

else
  puts 'Input command is invalid.'

end
