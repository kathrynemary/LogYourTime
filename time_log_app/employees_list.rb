require_relative 'employees'
require 'yaml/store'

class EmployeesList

  attr_reader :list, :admin_list
	
	def self.set_up_list(file="employees_list.yml")
	  @list = YAML::Store.new(file)
	end

	def self.add_name(input)
    unless @list
			set_up_list
		end	
		@list.transaction do
      @list[:name] ||= []
			@list[:name] << input
			@list.commit
		end
	end
  
	def self.return_list
    unless @list
			set_up_list
		end
			
		@list.transaction do
			@list[:name].each {|key, value| puts key, value } 
		end
	end	

	def self.set_up_admin_list(file="employee_admin_list.yml")
	  @admin_list = YAML::Store.new(file)
	end

	def self.add_admin_name(input)
    unless @admin_list
			set_up_admin_list
		end	
		@admin_list.transaction do
      @admin_list[:admin_name] ||= []
  		@admin_list[:admin_name] << input
	  	@admin_list.commit
	  end
	end

	def self.return_admin_list
    if @admin_list
			@admin_list.transaction do
				@admin_list[:admin_name].each {|key, value| puts key, value } 
			end
		end
	end	

end
