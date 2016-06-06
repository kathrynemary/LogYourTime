class SelectAction
	
  def initialize(employee)
    @employee = employee
	end
	
	def selection(input) 
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
	end

	def get_client
			display_client_list 
			puts "Which of these clients' hours would you like to view?"
			input = gets.chomp
			calculate_client_hours(input)
		rescue
			puts "There are no events listed yet!"
	end

	def display_client_list
    ClientsList.get_list
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
		puts TimeLogClientTotals.get_client_minutes_worked(client)
	end

	def get_employee
    EmployeesList.return_list
		puts "Which of these employees' hours would you like to view?"
	  input = gets.chomp
		TimeLogEmployeeMinutes.employee_totals(input)	
	  puts TimeLogEmployeeMinutes.sum
	end
	
	def add_employee
			employee = Employees.new
			puts "What is their name?"
			input = gets.chomp
			employee.add_new_employee(input)
	  rescue
			bad_employee_input
	end

	def bad_employee_input
    puts "That name is already in our records!"
		Employees.new.get_new_name
	end

	def add_client
			client = Clients.new
			puts "What is their name?"
			input = gets.chomp
			client.add_new_client(input)
	  rescue
      bad_client_input
	end

	def bad_client_input
		puts "That name is already in our records!"
		Clients.new.get_client_name	
	end

	def get_employee_events
		TimeLogEmployeeMinutes.employee_totals(@employee)	
	  @sum = TimeLogEmployeeMinutes.sum
	  puts @sum
	end

	def sum
		@sum
	end
  
end

