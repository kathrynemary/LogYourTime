class TimeLog

require 'date'
require 'time'

  attr_reader :start_time, :end_time

	def add_new_event(employee, start_time, end_time, type_of_work, client)
		time_length = calculate_hours_worked(start_time, end_time)
		@log = {'employee_name' => employee, 'start' => start_time, 'end' => end_time, 'hours_worked' => time_length, 'type' => type_of_work, 'name_of_client' => client}
	end

	def calculate_hours_worked(start_time=@start_time, end_time=@end_time)
		end_time - start_time
	end

	def log
	  FileWriter.write(@log)		
		@log
	end

  def enter_start_time(input)
	  @start_time = Date.new(input)
	end
 
	def enter_end_time(input)
		@end_time = Date.new(input)
	end

end
