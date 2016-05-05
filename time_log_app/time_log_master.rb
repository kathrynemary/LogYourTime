require_relative 'time_input_interface'
require_relative 'work_type_input_interface'
require_relative 'name_event_input_interface'
require 'time_diff'
require 'pstore'

class TimeLog

	attr_reader :start_time, :end_time, :hours_worked, :log

	def initialize(employee)
		@employee = employee
	  @event = PStore.new("events.pstore")
	end
	
  def add_new_event
    get_start_time
		get_end_time
    calculate_hours_worked
	  get_work_type
  	check_if_needs_client
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

  def check_if_needs_client
		unless @work_type == 'paid time off'
			get_client
	  else
			@client = "N/A"
		end
	end

  def get_client
		@client = NameInputInterface.new(ClientsList.list).get_name
	end

	def synthesize_info(employee, start_time, end_time, type_of_work, client)
		@log = {'employee_name' => @employee, 'start' => @start_time, 'end' => @end_time, 'hours_worked' => @hours_worked, 'type' => @work_type, 'name_of_client' => @client}
	end

	def calculate_hours_worked
		#@hours_worked = Time.diff(DateTime.parse(@start_time), DateTime.parse(@end_time), '%y, %d and %h:%m:%s')
		starting = DateTime.new("8:00")
  	ending = DateTime.new("12:00")
		@hours_worked = (ending - starting) #(DateTime.parse(@end_time) - DateTime.parse(@start_time))
	  @hours_worked
	end

	def write_to_log
	  @event.transaction do
			@event[:event] ||= []
			@event[:event] << @log
			@event.commit
		end
	end

	def get_events
    @read_events = @event.transaction { @event.fetch(:event) }
		@read_events
	end

  def display_events
    get_events
		puts @read_events
	end

end
