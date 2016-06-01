require 'yaml'

class TimeLogEmployeeMinutes

  def self.employee_totals(employee, file="events.yml")
		@employee = employee
	  @file = file
		TimeLogReader.get_employee_events(@employee, @file)
		@events = TimeLogReader.filter_by_employee
		total_time	
	  @sum = "#{@hours} hours and #{@minutes} minutes worked."
	end

  def self.sum
	 @sum
  end	 
 
	def self.total_time
		@total_minutes = 0
		@events.each do |key, value|
			key.each do |key2, value2|		
				if key2 == "minutes_worked"
					@total_minutes += value2
				  puts 
				end
			end
    end
		get_hours_from_minutes
	end

	def self.get_hours_from_minutes
    @minutes = @total_minutes % 60
		@hours = @total_minutes / 60
	end

	def self.total_minutes
		@total_minutes
	end

end
