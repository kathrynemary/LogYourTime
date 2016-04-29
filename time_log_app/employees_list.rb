require_relative 'employees'

class EmployeesList

  def self.set_up_list
	  @list = []	
	end

	def self.add_name(input)
    unless @list
			set_up_list
		end	
		@list.push(input)
	end
  
	def self.list
		@list
	end

	def self.admin_list
		@admin_list
	end

	def self.set_up_admin_list
	  @admin_list = []	
	end

	def self.add_admin_name(input)
    unless @admin_list
			set_up_admin_list
		end	
		@admin_list.push(input)
	end

end
