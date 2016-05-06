require_relative 'errors'

class CalculateHours

  require 'date'

  attr_reader :hours, :minutes

	def start_time(input)
	  @start_time = DateTime.parse(input)
	end

  def end_time(input)
    @end_time = DateTime.parse(input)
	end

	def calculate_hours
		total_minutes = ((@end_time - @start_time) * 24 * 60).to_i
      if total_minutes < 0
			  raise Errors::ArgumentError.new("The start time must be before the end time.")
			end
		@minutes = total_minutes % 60
		@hours = total_minutes / 60
	end
  
end
