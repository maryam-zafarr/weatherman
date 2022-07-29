# frozen_string_literal: true

require_relative 'calculation'

# Class for monthly weather report
class WeatherByMonth
  include BasicCalculations

  # Calculate average highest temperature
  def high_avg_temp
    file_name = extract_file_name
    data = extract_data(file_name, 2)
    result = data.max_by { |_k, v| v.to_i } [1]
    ['Highest Average:  ', result, 'C']
  end

  # Calculate average lowest temperature
  def low_avg_temp
    file_name = extract_file_name
    data = extract_data(file_name, 2)
    result = data.min_by { |_k, v| v.to_i } [1]
    ['Lowest Average:   ', result, 'C']
  end

  # Calculate average humidity
  def avg_humidity
    file_name = extract_file_name
    data = extract_data(file_name, 8)
    result = data.max_by { |_k, v| v.to_i } [1]
    ['Average Humidity: ', result, '%']
  end
end
