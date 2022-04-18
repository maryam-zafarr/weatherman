# frozen_string_literal: true

require File.expand_path('./weatherbymonth.rb', __dir__)
require File.expand_path('./weatherbyyear.rb', __dir__)
require File.expand_path('./weatherchart.rb', __dir__)

# Weatherman Driver class
class Weatherman
  include OutputReport

  # Option: -e
  def weather_by_year(year)
    weather_by_year = WeatherByYear.new(year)
    a = weather_by_year.max_temp
    b = weather_by_year.min_temp
    c = weather_by_year.max_humidity
    print_report_year([a, b, c])
  end

  # Option: -a
  def weather_by_month
    weather_by_month = WeatherByMonth.new
    a = weather_by_month.high_avg_temp
    b = weather_by_month.low_avg_temp
    c = weather_by_month.avg_humidity
    print_report_month([a, b, c])
  end

  # Option: -c
  def weather_chart
    weather_chart = WeatherChart.new
    weather_chart.display_chart
  end

  # Option: -d
  def weather_chart_combined
    weather_chart = WeatherChart.new
    weather_chart.display_chart_combined
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

when '-d'
  Weatherman.new.weather_chart_combined

else
  puts 'Input command is invalid.'

end
