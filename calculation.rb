# frozen_string_literal: true

require 'date'
require 'csv'

# Module to perform basic operations
module BasicCalculations
  def extract_args
    year_month = ARGV[1]
    path_files_folder = ARGV[2]
    year, month = year_month.split('/')
    [year, month, path_files_folder]
  end

  def extract_file_name
    year, month, path_files_folder = extract_args
    folder = File.basename(path_files_folder.to_s)
    month_name = Date::MONTHNAMES[month.to_i]
    "./#{folder}/#{folder}_#{year}_#{month_name[0..2]}.txt"
  end

  def file_path(month)
    _a, _b, path_files_folder = extract_args
    folder = File.basename(path_files_folder.to_s)
    month_name = Date::MONTHNAMES[month.to_i]
    "./#{folder}/#{folder}_#{@year}_#{month_name[0..2]}.txt"
  end

  def extract_data(file_name, col)
    file = File.open(file_name, 'r+')
    raw_data = {}
    file.drop(1).each do |line|
      data_array = line.split(',')
      raw_data[data_array[0]] = data_array[col]
    end
    raw_data.reject { |_key, value| value.empty? }
  end

  def month_name(month)
    Date::MONTHNAMES[month]
  end

  def format_date(date)
    Date.parse(date.to_s).strftime('%d')
  end

  def extract_month_year(date)
    Date.parse(date.to_s).strftime('%B %Y')
  end
end

# Module to perform weather calculations
module WeatherCalculations
  def months
    %w[Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec]
  end

  def calc_max(col)
    max_val, max_val_day, max_val_month = 0, 0, 0
    months.each_index do |month|
      file_name = file_path(month.next.to_i)
      data = extract_data(file_name, col)
      max_data = data.max_by { |_k, v| v.to_i }
      next unless max_data[1].to_i >= max_val

      max_val = max_data[1].to_i
      max_val_day = format_date(max_data[0])
      max_val_month = month_name(month.next)
    end
    [max_val, max_val_day, max_val_month]
  end

  def calc_min(col)
    min_val, min_val_day, min_val_month = 0, 0, 0
    months.each_index do |month|
      file_name = file_path(month.next.to_i)
      data = extract_data(file_name, col)
      min_data = data.min_by { |_k, v| v.to_i }
      next unless min_data[1].to_i <= min_val

      min_val = min_data[1].to_i
      min_val_day = format_date(min_data[0])
      min_val_month = month_name(month.next)
    end
    [min_val, min_val_day, min_val_month]
  end
end

# Module to print weather reports
module OutputReport
  def print_report_year(arr)
    arr.each do |a|
      puts "#{a[0]}: #{a[1]}#{a[4]} on #{a[2]} #{a[3]}"
    end
  end

  def print_report_month(arr)
    arr.each do |a|
      puts "#{a[0]}: #{a[1]}#{a[2]}"
    end
  end
end
