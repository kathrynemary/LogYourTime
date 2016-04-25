require_relative 'errors'

class Clients

  attr_reader :list 
 
	def initialize
	  @list = []
	end

  def add_new_client(company_name)
    double_check(company_name)
		verify_input(company_name)
		@list.push(company_name)
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
