require 'spec_helper'

describe LogIn do
	
	before :each do
		EmployeeUsernames.set_up_file("spec/spec_data_files/example_log_in_employee_usernames.yml")
	  EmployeeUsernames.set_up_username("Idina Menzel", "iwasinrent")
	  EmployeeUsernames.set_up_username("Ron Swanson", "libertarian")
		EmployeesList.add_name("Idina Menzel")
		EmployeesList.add_name("Ron Swanson")
	  EmployeesList.set_up_admin_list("spec/spec_data_files/example_log_in_admin_employees_list.yml")
	  EmployeesList.add_admin_name("Ron Swanson")
	end

	it "should not raise an error if an admin selects an admin-only option." do
		example_login = LogIn.new
	  example_login.set_employee('libertarian')
		example_login.check_admin_list("spec/spec_data_files/example_log_in_admin_employees_list.yml")
		expect(example_login.is_admin).to eq(true)
	end

  it "should raise an error if a non-admin selects an admin-only option." do
		example_login = LogIn.new
		allow(example_login).to receive(:non_admin_options) {4}
	  expect { example_login.log_in('iwasinrent') }.to raise_error(Errors::ArgumentError)
	end

end
