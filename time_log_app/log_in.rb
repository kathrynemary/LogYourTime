require_relative 'employee_usernames'
require_relative 'employees_list'
require_relative 'clients_list'
require 'yaml/store'

class LogIn

  attr_reader :employee
	
	def initialize(username)
	  @employee = EmployeeUsernames.employee(username)  
  	@admin_list = EmployeesList.return_admin_list
		puts "Welcome, #{@employee}."
	end

	def display_options
  	if @admin_list.include?(@employee)
	    answer = admin_options
			verify_admin_input(answer)
		else
	    answer = non_admin_options
      verify_non_admin_input(answer)
		end
	  select_action(answer)
	end

  def select_action(input)
    if input == '1'
		  TimeLog.new(@employee).add_new_event
		  puts "Thank you! Your time has been logged."	
		elsif input == '2'
		  display_employee_events
		elsif input == '3'
			add_employee
		elsif input == '4'
      display_client_list
			add_client	
    elsif input == '5'
      'run monthly totals by employee'
		elsif input == '6'
      get_client
		end
  end

	def get_client
    ClientsList.new.display_list
		puts "Which of these clients' hours would you like to view?"
	  input = gets.chomp
	  calculate_client_hours
	end

	def calculate_client_hours(input) 
		TimeLogClientTotals.get_client_minutes_worked(client)
		puts TimeLogClientTotals.sum
	end

	def add_employee
    employee = Employees.new
		puts "What is their name?"
	  input = gets.chomp
		employee.add_new_employee(input)
	end

	def display_client_list
    ClientsList.new.display_list
	end

	def add_client
    client = Clients.new
		puts "What is their name?"
	  input = gets.chomp
		client.add_new_client(input)
	end

	def display_employee_events
    TimeLogReader.get_events(@employee)
	end
  
	def non_admin_options
    puts "press 1 to log time, or 2 to view this month's hours"
	  gets.chomp
	end

  def verify_non_admin_input(input)
		if input =~ /^[12]/
			input
		else
			raise Errors::ArgumentError.new("that is wrong! you entered #{input}")
	  end
	end
  
	def admin_options
    puts "press 1 to log time, 2 to view your for the month, 3 to add a new employee, 4 to add a new client, 5 to run the month's totals by employee, or 6 to run the month's totals by client"
	  gets.chomp
	end
  
	def verify_admin_input(input)
		if input =~ /^[123456]/
			input
		else
			raise Errors::ArgumentError.new("that is wrong! you entered #{input}")
	  end
	end

end
