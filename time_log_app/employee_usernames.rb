require_relative 'employees'
require_relative 'errors'

class EmployeeUsernames
		
	def self.set_up_username(employee, username)
		@user = {employee => username}
	end

	def self.username(employee)
		if @user.has_key?(employee)
			@user[employee]
		else
			raise Errors::ArgumentError.new("We don't have a record of that employee!") 
		end
	end
	
	def self.employee(username)
		if @user.has_value?(username)
			@user.key(username)
		else
			raise Errors::ArgumentError.new("We don't have a record of that username!") 
		end
	end

end
