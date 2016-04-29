require_relative 'work_type_input_interface'
require_relative 'time_input_interface'
require_relative 'name_event_input_interface'

class EventInputSynthesizer

	attr_reader :work_type
	
#	def build_event
#		get_client
#		get_employee
#		get_start_time
#		get_end_time
#		get_hours_worked
#		get_work_type
#	end

  def get_work_type
	  type = WorkTypeInterface.new
		@work_type = type.get_timecode
	end

end
