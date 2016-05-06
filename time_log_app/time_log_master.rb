require_relative 'time_input_interface'
require_relative 'work_type_input_interface'
require_relative 'name_event_input_interface'
require_relative 'calculate_hours_worked'
require 'PStore'

class TimeLog

	attr_reader :start_time, :end_time, :minutes_worked, :log, :event, :work_type, :client

	def self.new_event(employee)
		@employee = employee
	  @log = PStore.new("events.pstore")
	end
	
  def self.add_new_event
    get_start_time
		get_end_time
    calculate_time_worked
	  get_work_type
  	check_if_needs_client
		write_to_log
	end

	def self.stub_new_event
	  @start_time = "April 1 2016, 8:00"
		@end_time = "April 1 2016, 12:00"
    @work_type = "billable"
		@client = "MegaCorp"
    @minutes_worked = 240
    write_to_log
	end

	def self.get_start_time
    @start_time = TimeInputInterface.new.get_time_and_date
	end

	def self.get_end_time
		@end_time = TimeInputInterface.new.get_time_and_date
	end

	def self.calculate_time_worked
		@minutes_worked = CalculateHours.new(@start_time, @end_time).calculate_hours.total_minutes 
	end

	def self.get_work_type
	  @work_type = WorkTypeInterface.new.get_timecode
	end

  def self.check_if_needs_client
		unless @work_type == 'paid time off'
			get_client
	  else
			@client = "N/A"
		end
	end

	def self.write_to_log
	  @log.transaction do
			@log[:employee] ||= []
			@log[:start] ||= []
			@log[:end] ||= []
			@log[:time_worked] ||= []
			@log[:work_type] ||= []
			@log[:client] ||= []
			@log[:employee] << @employee
			@log[:start] << @start_time
			@log[:end] << @end_time
			@log[:time_worked] << @hours_worked
			@log[:work_type] << @work_type
			@log[:client] << @client
			@log.commit
		end
	end

  def self.get_event(key)
	  @log.transaction do
		  @log[key]
		end
	end

end
