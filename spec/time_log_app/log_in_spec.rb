#The files for test/example data are located in the spec/spec_data_files folder.
#Each filename starts with "example" followed by the name of the class being tested,
#then the file's normal name. 
#Lines are commented out so that they will not persist the same data each time the test is run.

require 'spec_helper'

describe LogIn do
	
	before :each do
		EmployeeUsernamesList.set_up_file("spec/spec_data_files/example_log_in_employee_usernames.yml")
#	  EmployeeUsernamesList.set_up_username("Idina Menzel", "iwasinrent")
#	  EmployeeUsernamesList.set_up_username("Ron Swanson", "libertarian")
#		EmployeesList.add_name("Idina Menzel")
#		EmployeesList.add_name("Ron Swanson")
	  EmployeesList.set_up_list("spec/spec_data_files/example_log_in_employees_list.yml")
	  EmployeesList.set_up_admin_list("spec/spec_data_files/example_log_in_admin_employees_list.yml")
#	  EmployeesList.add_admin_name("Ron Swanson")
	end

	it "should get the employee from the username" do 
	  example = LogIn.new
		example.set_employee('libertarian')
	  expect(example.employee).to eq("Ron Swanson")
	end
	
	it "should correctly classify an admin employee" do
		example_login = LogIn.new
	  example_login.set_employee('libertarian')
		example_login.check_admin_list("spec/spec_data_files/example_display_options_admin_employees_list.yml")
		expect(example_login.employee_type).to eq("admin")
	end
	
	it "should correctly classify a non-admin employee" do
		example_login = LogIn.new
	  example_login.set_employee('iwasinrent')
		example_login.check_admin_list("spec/spec_data_files/example_display_options_admin_employees_list.yml")
		expect(example_login.employee_type).to eq("non-admin")
	end
 
end
