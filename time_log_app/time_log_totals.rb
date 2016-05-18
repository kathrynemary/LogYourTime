require 'yaml'

class TimeLogTotals

  def self.start
		@start
	end

  def self.employee_totals(employee)
		@employee = employee
		@events = TimeLogReader.get_events(@employee)
	  @file = TimeLogReader.file
		total_time	
	  @sum = "#{@hours} hours and #{@minutes} minutes worked."
	end

  def self.sum
	 @sum
  end	 
 
	def self.get_start_time(employee)
		TimeLogReader.get_employee_events(employee)
    @file = TimeLogReader.updated_file
    @start = @file[@file.keys[0]]["start"]
	end

	def self.total_time
    @total_minutes = 0
		@file.each do |key, value|
	    value.each do |key2, value2|		
				if key2 == "minutes_worked"
			  	@total_minutes += value2
				end
			end
    end
		get_hours_from_minutes
	end

	def self.get_hours_from_minutes
    @minutes = @total_minutes % 60
		@hours = @total_minutes / 60
	end

end
