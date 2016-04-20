class Employees
  
	def initialize
	  @list = []
	end

  def add_new_employee(name)
	  @list.push(name)
	end

  def list
		@list
	end

end

class Admins < Employees

end
