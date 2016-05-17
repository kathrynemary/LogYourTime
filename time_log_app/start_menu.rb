require_relative 'employees_list'

class StartMenu

  attr_reader :list_length
	
	def initialize
		get_employee_list
    evaluate_list
	end

  def evaluate_list
		if @list_length != 0
			log_in_menu
		else
			start_menu
		end
	end

  def get_employee_list
	  @list_length = 0	
		(File.open("employees_list.yml")).each_line do |line|
			@list_length += 1
    end		
		@list_length
	end

  def start_menu
	  puts "Welcome! You are the first employee."	
		puts "What is your name?"
	  input = gets.chomp
    Employees.new.add_new_employee(input)
    StartMenu.new
	end
  
  def log_in_menu
		puts "Please enter your username."
		input = gets.chomp
    LogIn.new.log_in(input)
	end

end
