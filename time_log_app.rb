require_relative 'time_log_app/calculate_hours_worked'
require_relative 'time_log_app/clients_list'
require_relative 'time_log_app/clients'
require_relative 'time_log_app/employee_usernames'
require_relative 'time_log_app/employees'
require_relative 'time_log_app/errors'
require_relative 'time_log_app/log_in'
require_relative 'time_log_app/start_menu'
require_relative 'time_log_app/log_writer'
require_relative 'time_log_app/name_event_input_interface'
require_relative 'time_log_app/time_input_interface'
require_relative 'time_log_app/time_log_master'
require_relative 'time_log_app/work_type_input_interface'
require 'yaml/store'

class TimeLogApp

	def self.run
	  StartMenu.new
	end

end

#TimeLogApp.run
