require_relative 'errors'

class Employees
  
  attr_reader :list

	def initialize
	  @list = []
	end

  def add_new_employee(name)
	  double_check(name)
		verify_input(name)
		@list.push(name)
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
end

class Admins < Employees

end
