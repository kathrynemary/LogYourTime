class LogIn
	
	def log_in(username) 
		set_employee(username)
		check_admin_list(file="employee_admin_list.yml")
		puts "Welcome, #{@employee}."
    DisplayOptions.new.display_options(@employee, @employee_type)
	end

  def set_employee(username)
		@employee = EmployeeUsernamesList.employee(username)  
	end

  def employee
		@employee
	end
  
  def employee_type
		@employee_type
	end

	def check_admin_list(file)
    get_admin_list(file)
		@admin_list.each do |value|
		  if value.include?(@employee.to_s)
			  @employee_type = "admin"
	    else
				@employee_type = "non-admin"
		  end
		end
	end

	def get_admin_list(file) 
    unless File.zero?(file)
			@admin_list = YAML.load(File.open(file)).values
		else
			@admin_list = []
    end
	end

end
