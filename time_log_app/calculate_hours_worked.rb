require_relative 'errors'

class CalculateHours

  require 'date'

  def initialize(start, stop)
    start_time(start)
    end_time(stop)
    calculate_hours
  end

  def start_time(input)
    @start_time = DateTime.parse(input)
  end

  def end_time(input)
    @end_time = DateTime.parse(input)
  end

  def calculate_hours
    @total_minutes = ((@end_time - @start_time) * 24 * 60).to_i
    if @total_minutes < 0
      wrong_time_input
    end
  end

  def wrong_time_input
    raise Errors::ArgumentError.new
  rescue
    puts "The start time must be before the end time."
  end

  def total_minutes
    @total_minutes
  end	

end
