require_relative 'errors'
require_relative 'clients_list'

class Clients

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
		if @list.include? name
			raise Errors::ArgumentError.new("That name is already in our records!")
    else
			name
		end
	end

end
