require 'spec_helper'

describe DisplayOptions do
	
	before :each do
		EmployeeUsernamesList.set_up_file("spec/spec_data_files/example_display_options_employee_usernames.yml")
	  #EmployeeUsernamesList.set_up_username("Idina Menzel", "iwasinrent")
	  #EmployeeUsernamesList.set_up_username("Ron Swanson", "libertarian")
		#EmployeesList.add_name("Idina Menzel")
		#EmployeesList.add_name("Ron Swanson")
	  EmployeesList.set_up_list("spec/spec_data_files/example_display_options_employees_list.yml")
	  EmployeesList.set_up_admin_list("spec/spec_data_files/example_display_options_admin_employees_list.yml")
#	  EmployeesList.add_admin_name("Ron Swanson")
	end

  it "should redirect bad input" do
		expect { DisplayOptions.new.invalid_input }.to raise_error { |error|
			expect(error).to be_a(Errors::NotAnOptionError)
		}
	end
 
end

