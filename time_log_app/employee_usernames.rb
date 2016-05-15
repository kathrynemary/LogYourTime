require_relative 'employees'
require_relative 'errors'
require 'yaml/store'

class EmployeeUsernames
	
  def self.set_up_file
		@list = YAML::Store.new("employee_usernames.yml")
	end

	def self.set_up_username(employee, username)
		@user = {:employee => employee, :username => username}
    set_up_file
	 	add_to_list
	end

	def self.add_to_list
    @list.transaction do
			@list[:user] ||= []
			@list[:user] << @user
			@list.commit
		end
	end
	
	def self.username(employee)
		unless @list
			set_up_file
		end

		@list.transaction do
		  @list[:user].each do |key, value| 
			  if key.has_value?(employee)
				  @answer = key[:username]
				end
				unless @answer		
		      raise Errors::ArgumentError.new("We don't have a record of that employee!") 
			  end
			end
		end
		@answer
	end
	
	def self.employee(username)
		unless @list
			set_up_file
		end

		@list.transaction do
		  @list[:user].each do |key, value| 
			  if key.has_value?(username)
				  @answer = key[:employee]
			 	end
			end
		end	
	end

end

