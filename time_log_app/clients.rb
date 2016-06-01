require_relative 'errors'
require_relative 'clients_list'
require 'yaml/store'

class Clients

	def initialize(file="clients_list.yml")
	  @file = file
		@list = YAML.load(File.open(@file))
	end

  def file
		@file
	end

	def add_new_client(company_name)
		double_check(company_name)
		verify_input(company_name)
		ClientsList.add_name(company_name)
	end

	def double_check(name)
		puts "You entered '#{name}'. Is this correct? Y/N"
		answer = gets.upcase.chomp
		unless answer == "Y"
	  	puts "Okay, let's try again."
		  get_client_name
		end
	end
	
	def get_client_name
		puts "What is the name?"
		require 'pry'; binding.pry
		input = gets.chomp
	  add_new_client(input)
	end

  def verify_input(name)
		unless File.zero?(@file)	
			@list.each do |key, value|
				if value.flatten.include?(name)
				  invalid_input
				else
					name
				end
			end
		else
			name
		end
	end

  def invalid_input
		raise Errors::DuplicateNameError.new
		#rescue
		#	puts "That name is already in our records!"
		#	get_client_name	V
  end

end
