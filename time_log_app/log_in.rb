require_relative 'employee_usernames'
require_relative 'employees_list'
require_relative 'clients_list'
require_relative 'time_log_reader'
require 'yaml/store'

class LogIn
	
	def log_in(username) 
		@employee = EmployeeUsernames.employee(username)  
		check_admin_list(file="employee_admin_list.yml")
		puts "Welcome, #{@employee}."
    display_options
	end

	def get_username
    puts "Please enter your username:"
		answer = gets.chomp
		LogIn.new(answer)
	end
	
  def employee
		@employee
	end
  
	def check_admin_list(file)
    get_admin_list(file)
		@admin_list.each do |value|
		 if value.include?(@employee.to_s)
			  @is_admin = true
			end
		end
	end

	def get_admin_list(file) 
		@admin_list = YAML.load(File.open(file)).values
	end

	def display_options
  	if @is_admin == true
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
			log_time
		elsif input == '2'
		  get_employee_events
		elsif input == '3'
			exit_program	
		elsif input == '4'
			add_employee
		elsif input == '5'
			add_client	
    elsif input == '6'
      get_employee
		elsif input == '7'
      get_client
		end
    display_options
	end

	def get_client
    display_client_list 
		puts "Which of these clients' hours would you like to view?"
	  input = gets.chomp
	  calculate_client_hours(input)
	end
  
	def exit_program
		puts "Thank you!"
		exit
	end
	
  def log_time
		puts "Please enter the start time and date, followed by the end time and date."  
		TimeLog.add_new_event(@employee)
		puts "Thank you! Your time has been logged."
	end

	def calculate_client_hours(client) 
		TimeLogClientTotals.get_client_minutes_worked(client)
		puts TimeLogClientTotals.sum
	end

	def get_employee
    EmployeesList.new.display_list
		puts "Which of these employees' hours would you like to view?"
	  input = gets.chomp
		TimeLogTotals.employee_totals(input)	
	end
	
	def add_employee
    employee = Employees.new
		puts "What is their name?"
	  input = gets.chomp
		employee.add_new_employee(input)
	end

	def display_client_list
    ClientsList.get_list
	end

	def add_client
    client = Clients.new
		puts "What is their name?"
	  input = gets.chomp
		client.add_new_client(input)
	end

	def get_employee_events
    puts TimeLogReader.get_employee_events(@employee)
	end
  
	def non_admin_options
    puts "Press 1 to log time, 2 to view this month's hours, or 3 to exit."
	  gets.chomp
	end

  def verify_non_admin_input(input)
		if input =~ /^[123]/
			input
		else
			raise Errors::ArgumentError.new("That input is not valid. Let's try again.")
	    display_options
		end
	end
  
	def admin_options
    puts "Press 1 to log time, 2 to view your for the month, 3 to exit, 4 to add a new employee, 5 to add a new client, 6 to run the month's totals by employee, or 7 to run the month's totals by client"
	  gets.chomp
	end
  
	def verify_admin_input(input)
		if input =~ /^[1234567]/
			input
		else
			raise Errors::ArgumentError.new("That is wrong! you entered #{input}.")
			display_options
	  end
	end

end
