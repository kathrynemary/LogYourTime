require_relative 'errors'
require_relative 'employees_list'
require_relative 'employee_usernames'
require 'yaml/store'

class Employees
  
  attr_reader :list, :admins, :user_names

	def initialize(list="employees_list.yml", admin_list="employee_admin_list.yml", user="employee_usernames.yml")
    @list = list
	  @admin_list = admin_list
		@user_names = user
	end

  def add_new_employee(name)
	  double_check(name)
		verify_input(name)
    get_user_name(name)
		admin?(name)
		EmployeesList.add_name(name)
	end

  def get_user_name(name)
	  user = ask_user_name
    double_check_user(user)
		verify_user_name(user)
	  EmployeeUsernames.set_up_username(name, user)
	end

  def ask_user_name
	  puts "What would you like the username to be?"
	  answer = gets.chomp	
		answer
	end

  def double_check(name)
		puts "You entered '#{name}'. Is this correct? Y/N"
		answer = gets.upcase.chomp
		if answer == "N"
		  puts "Okay, never mind then!"
      get_employee_name
		end
	end
  
	def double_check_user(name)
		puts "You entered '#{name}'. Is this correct? Y/N"
		answer = gets.upcase.chomp
		if answer == "N"
		  puts "Okay, never mind then!"
		  ask_user_name
		end
	end

	def get_employee_name
		puts "What is the name?"
		input = gets.chomp
	  add_new_employee(input)
	end

  def verify_input(name)
		(File.open(@list)).each_line do |line|
			if line.include? name
				raise Errors::ArgumentError.new("That name is already in our records!")
		  end
		end
	end
  
	def verify_user_name(name)
		if File.read(@user_names).include? name
			raise Errors::ArgumentError.new("That username is already in our records!")
      get_user_name(name)
	 	else
			name
		end
	end

	def admin?(name)
		puts "Would you like #{name} to be an admin? Y/N"
		answer = gets.upcase.chomp
		if answer == "Y"
			push_admin(name)
		else
			puts "Guess not then!"
		end
	end

	def push_admin(name)
		puts "You answered yes."
		EmployeesList.add_admin_name(name)
	end

end

