require_relative 'time_input_interface'
require_relative 'work_type_input_interface'
require_relative 'name_event_input_interface'
require 'time_diff'

class TimeLog

	attr_reader :start_time, :end_time, :hours_worked, :log

	def initialize(employee)
		@employee = employee
	end
	
  def add_new_event
    get_start_time
		get_end_time
    calculate_hours_worked
	  get_work_type
  	get_client
		synthesize_info(@employee, @start_time, @end_time, @type_of_work, @client)
		write_to_log
	end

  def get_start_time
    @start_time = TimeInputInterface.new.get_time_and_date
	end	
	
  def get_end_time
		@end_time = TimeInputInterface.new.get_time_and_date
  end	
	
  def get_work_type
		@work_type = WorkTypeInterface.new.get_timecode 
  end	
	
  def get_client
	#  @client = NameInputInterface.new(ClientsList.list).get_name
	  @client = "MegaCorp"
	end

	def synthesize_info(employee, start_time, end_time, type_of_work, client)
		@log = {'employee_name' => @employee, 'start' => @start_time, 'end' => @end_time, 'hours_worked' => @hours_worked, 'type' => @work_type, 'name_of_client' => @client}
	end

	def calculate_hours_worked
		@hours_worked = Time.diff(DateTime.parse(@start_time), DateTime.parse(@end_time), '%y, %d and %h:%m:%s')
	end

	def write_to_log
	  FileWriter.write(@log)		
	end

end

