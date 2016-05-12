require_relative 'employees'
require_relative 'clients'
require_relative 'errors'

class NameInputInterface

  attr_reader :selection, :names

  def initialize(names)
	  @names = names
	end

	def list_names 
	  names = @names
		names
	end

  def get_name
	  input = ask_name
		verify_input(input)
	  @selection = input
	end

	def ask_name
    puts "Please enter the name of the client."
		gets.chomp
	end

	def verify_input(input)
		if @names.include? input
			input
		else
			raise Errors::ArgumentError.new("The name #{input} isn't in my records!")
		end
	end

end
