require 'yaml/store'

class TimeLog

	attr_accessor :start_time, :end_time, :minutes_worked, :log, :event, :work_type, :client

	def self.new_event(employee)
		@employee = employee
	  @log = YAML::Store.new("events.yml")
	  @employee_log = YAML::Store.new("#{@employee}.yml")
	end
	
  def self.add_new_event
    get_start_time
		get_end_time
    calculate_time_worked
	  get_work_type
  	check_if_needs_client
		write_to_log
	end
	
	def self.stub_another_event
	  @start_time = "October 3 2015, 10:30"
		@end_time = "October 3 2015, 12:30"
    @work_type = "billable"
		@client = "MegaCorp"
    @minutes_worked = 120
		write_to_log
	end

	def self.stub_new_event
	  @start_time = "April 26 2016, 9:00"
		@end_time = "April 26 2016, 10:00"
    @work_type = "billable"
		@client = "AnonyCorp"
    @minutes_worked = 60
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
		if @work_type == 'paid time off'
			@client = "N/A"
		else
			get_client
		end
	end

	def self.synthesize_info
    @event = {'employee' => @employee, 'start' => @start_time, 'end' => @end_time, 'minutes_worked' => @minutes_worked, 'work_type' => @work_type, 'client' => @client} 
	end

	def self.write_to_log
		synthesize_info
		@log.transaction do
			@log[@employee => @start_time] = @event
			@log.commit
		end
		@employee_log.transaction do
			@employee_log[@start_time] = @event
			@employee_log.commit
		end
	end

#Will display file in readable-ish manner.
#  def self.get_event
#		File.read("events.yml")  
#		puts File.read("events.yml")
#	end

  def self.get_event(key)
	  @log.transaction do
		  puts @log[key]
		  @log[key]
		end
	end

end
