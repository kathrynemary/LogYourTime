require 'PStore'

class EmployeesListReader

  def self.read
	  var = File.read("employees_list.pstore")
		puts var
		var
	end
  
	def self.read_admins
	  var = File.read("employee_admin_list.pstore")
		puts var
		var
	end

end
