require_relative 'employee_usernames'
require_relative 'employees_list'

class LogIn

  attr_reader :employee
	
	def initialize(username)
	  @employee = EmployeeUsernames.employee(username)  
  	@admin_list = EmployeesList.admin_list
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
		  'view hours'
		elsif input == '3'
			add_employee
		elsif input == '4'
      display_client_list
			add_client	
    elsif
      'run monthly totals by employee'
		elsif
      'run monthly totals by client'
		end
  end

	def add_employee
    employee = Employees.new
		puts "What is their name?"
	  input = gets.chomp
		employee.add_new_employee(input)
	end

	def display_client_list
    ClientsList.return_list
	end

	def add_client
    client = Clients.new
		puts "What is their name?"
	  input = gets.chomp
		client.add_new_client(input)
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
