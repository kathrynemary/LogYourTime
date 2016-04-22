class Employees
  
  attr_reader :list

	def initialize
	  @list = []
	end

  def add_new_employee(name)
	  @list.push(name)
	end

end

class Admins < Employees

end
