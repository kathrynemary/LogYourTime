require_relative 'errors'
require_relative 'clients_list'
require 'yaml/store'

class Clients

	def initialize
    @list = YAML::Store.new("clients_list.yml")
	end

	def add_new_client(company_name)
    double_check(company_name)
		verify_input(company_name)
    ClientsList.add_name(company_name)
	end

	def double_check(name)
		puts "You entered '#{name}'. Is this correct? Y/N"
		answer = gets.upcase.chomp
		if answer == "N"
		  raise Errors::ArgumentError.new("Okay, never mind then!")
		end
	end

  def verify_input(name)
		@list.transaction do
		if @list[:name].include?(name)
				raise Errors::ArgumentError.new("That name is already in our records!")
			else
				name
			end
		end
	end

	def get_list
		@list.transaction do
      @list[:name]
		end
  end

end
