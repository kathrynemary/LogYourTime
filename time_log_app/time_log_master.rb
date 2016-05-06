require_relative 'time_input_interface'
require_relative 'work_type_input_interface'
require_relative 'name_event_input_interface'
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

  def check_if_needs_client
		unless @work_type == 'paid time off'
			get_client
	  else
			@client = "N/A"
		end
	end

	def synthesize_info(employee, start_time, end_time, type_of_work, client)
		@log = {'employee_name' => @employee, 'start' => @start_time, 'end' => @end_time, 'hours_worked' => @hours_worked, 'type' => @work_type, 'name_of_client' => @client}
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
