require_relative 'errors'
require_relative 'clients_list'
require 'yaml/store'

class Clients

	def initialize(file="clients_list.yml")
    @list = YAML::Store.new(file)
	end

	def add_new_client(company_name)
		double_check(company_name)
		verify_input(company_name)
		ClientsList.add_name(company_name)
	end

	def double_check(name)
		puts "You entered '#{name}'. Is this correct? Y/N"
		answer = gets.upcase.chomp
		puts answer ########################
		unless answer == "Y"
		  raise Errors::ArgumentError.new("Okay, let's try again.")
		  get_client_name
		end
	end
	
	def get_client_name
		puts "What is the name?"
		input = gets.chomp
	  add_new_client(input)
	end

  def verify_input(name)
		@list.transaction do
		if @list[:name].include?(name)
			raise Errors::ArgumentError.new("That name is already in our records!")
		  get_client_name	
		else
				name
			end
		end
	end

end
