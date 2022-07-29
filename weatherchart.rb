# frozen_string_literal: true

require_relative 'calculation'
require 'colorize'

# Class to display horizontalbar chart for highest and lowest temp
class WeatherChart
  include BasicCalculations

  def draw_combine(day, max_temp, min_temp)
    print "#{day}  "
    draw_min_temp(min_temp)
    draw_max_temp(max_temp)
    display_range(min_temp, max_temp)
  end

  def draw_min_temp(min_temp)
    min_temp.to_i.times do
      print '+'.blue
    end
  end

  def draw_max_temp(max_temp)
    max_temp.to_i.times do
      print '+'.red
    end
  end

  def display_range(min_temp, max_temp)
    print " #{min_temp}C - #{max_temp}C"
    print("\n")
  end

  def display_date(hash)
    date = hash.keys[0]
    puts extract_month_year(date)
  end

  def display_data
    file_name = extract_file_name
    data_high = extract_data(file_name, 1)
    data_low = extract_data(file_name, 3)
    data_high.merge(data_low) { |_key, old, new| Array(old).push(new) }
  end

  def display_chart
    data = display_data
    display_date(data)
    data.each do |k, v|
      print "#{format_date(k)} "
      draw_max_temp(v[0])
      print " #{v[0]} C \n"
      print "#{format_date(k)} "
      draw_min_temp(v[1])
      print " #{v[1]} C \n"
    end
  end

  def display_chart_combined
    data = display_data
    display_date(data)
    data.each do |k, v|
      draw_combine(format_date(k), v[0], v[1])
    end
  end
end
