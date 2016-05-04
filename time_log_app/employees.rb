require_relative 'errors'
require_relative 'employees_list'
require_relative 'employee_usernames'
require 'pstore'

class Employees
  
  attr_reader :list, :admins, :user_names

	def initialize
	  @list = []
		@admins = []
		@user_names = []
	end

  def add_new_employee(name)
	  double_check(name)
		verify_input(name)
    get_user_name(name)
		admin?(name)
		@list.push(name)
		EmployeesList.add_name(name)
	end

  def get_user_name(name)
	  user = ask_user_name
    double_check(user)
		verify_user_name(user)
		@user_names.push(user) 
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
		  raise Errors::ArgumentError.new("Okay, never mind then!")
		end
	end

  def verify_input(name)
		if @list.include? name
			raise Errors::ArgumentError.new("That name is already in our records!")
    else
			name
		end
	end
  
	def verify_user_name(name)
		if @user_names.include? name
			raise Errors::ArgumentError.new("That username is already in our records!")
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
		puts "you answered yes"
		@admins.push(name)
		EmployeesList.add_admin_name(name)
	end

end

