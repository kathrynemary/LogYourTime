require 'yaml'

class TimeLogTotals

  def self.start
		@start
	end

  def self.employee_totals(employee)
		@employee = employee
		TimeLogReader.get_events(@employee)
	  total_hours	
	  @sum = "#{@hours} hours and #{@minutes} minutes worked."
	end

  def self.sum
	 @sum
  end	 
 
	def self.get_start_time
		TimeLogReader.get_events("Jane Doe")
    @file = TimeLogReader.updated_file
    @start = @file[@file.keys[0]]["start"]
	end

	def self.total_hours
    @total_minutes = 0
		@file.keys.each do |number|
			mins = @file[number]["minutes_worked"].to_i
			@total_minutes += mins 
    end
		get_hours_from_minutes
	end

	def self.get_hours_from_minutes
    @minutes = @total_minutes % 60
		@hours = @total_minutes / 60
	end

end
