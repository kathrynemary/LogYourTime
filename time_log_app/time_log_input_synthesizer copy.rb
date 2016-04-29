require_relative 'work_type_input_interface'
require_relative 'time_input_interface'
require_relative 'name_event_input_interface'

class EventInputSynthesizer

	attr_reader :client, :client_names, :start_time 
	
	def build_event
		get_client
		get_employee
		get_start_time
		get_end_time
		get_hours_worked
		get_work_type
	end

	def get_client
		puts "What client is this for?"
		client_names = NameInputInterface.new(ClientsList.list)
		@client = client_names.get_name
	 # @client = "MegaCorp"
	end

	def get_employee
		puts "Who are you?"
		@employee = NameInputInterface.new(EmployeesList).get_name
	end

  def get_start_time
		puts "First I need the start-time:"
	  start = TimeInputInterface.new
	  @start_time = start.get_time_and_date
	end

	def get_end_time
		puts "Now we need the end-time:"
    @end_time = TimeInputInterface.get_time_and_date
	end

  def get_hours_worked
		time_length = @end_time - @start_time
    verify_hours_worked(time_length)	
	end

	def verify_hours_worked(input)
    if input > 0
			input
		else
			raise Errors::ArgumentError.new("That input is invalid.")
		end
	end

  def get_work_type
	  @work_type = WorkTypeInterface.get_timecode
	end

	def push_event
		TimeLog.add_new_event(@employee, @start_time, @end_time, @work_type, @client)
	end
end
