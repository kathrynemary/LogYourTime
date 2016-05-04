require_relative 'employees'
require 'PStore'

class EmployeesList

  attr_reader :list, :admin_list
	
	def self.set_up_list
	  @list = PStore.new("employees_list.pstore")
	end

	def self.add_name(input)
    unless @list
			set_up_list
		end	
		@list.transaction do
			@list[:name] << input
			@list.commit
		end
	end
  
	def self.return_list
    read_file = @list.transaction { @list.fetch(:name) }
	  read_file
	end	

	def self.set_up_admin_list
	  @admin_list = PStore.new("employee_admin_list.pstore") 
	end

	def self.add_admin_name(input)
    unless @admin_list
			set_up_admin_list
		end	
		@admin_list.transaction do
  		@admin_list[:admin_name] << input
	  	@admin_list.commit
	  end
	end

	def self.return_admin_list
    read_file = @admin_list.transaction { @admin_list.fetch(:admin_name) }
	  read_file
	end	

end
