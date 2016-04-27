require_relative 'errors'
require_relative 'employees_list'

class Employees
  
  attr_reader :list, :admins

	def initialize
	  @list = []
		@admins = []
	end

  def add_new_employee(name)
	  double_check(name)
		verify_input(name)
		admin?(name)
		@list.push(name)
		EmployeesList.add_name(name)
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

