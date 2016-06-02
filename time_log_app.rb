require_relative 'time_log_app/calculate_hours_worked'
require_relative 'time_log_app/clients_list'
require_relative 'time_log_app/clients'
require_relative 'time_log_app/employee_usernames'
require_relative 'time_log_app/employee_usernames_list'
require_relative 'time_log_app/employees_list'
require_relative 'time_log_app/employees'
require_relative 'time_log_app/employee_admins'
require_relative 'time_log_app/errors'
require_relative 'time_log_app/log_in'
require_relative 'time_log_app/display_options'
require_relative 'time_log_app/select_action'
require_relative 'time_log_app/start_menu'
require_relative 'time_log_app/time_input_interface'
require_relative 'time_log_app/time_log_client_totals'
require_relative 'time_log_app/time_log_master'
require_relative 'time_log_app/time_log_reader'
require_relative 'time_log_app/time_log_employee_minutes'
require_relative 'time_log_app/work_type_input_interface'
require 'yaml/store'

class TimeLogApp

	def self.run
	  StartMenu.load_menu
	end

end

#TimeLogApp.run
