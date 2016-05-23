require_relative 'employees'
require_relative 'errors'
require 'yaml/store'

class EmployeeUsernamesList
	
  def self.set_up_file(file="employee_usernames.yml")
		@list = YAML::Store.new(file)
	end

	def self.set_up_username(employee, username)
		@user = {:employee => employee, :username => username}
    unless @list
			set_up_file
		end
		add_to_list
	end

	def self.add_to_list
    unless @list
			set_up_file
		end

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
    @answer
	end

end

