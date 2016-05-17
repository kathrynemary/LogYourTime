require 'spec_helper'

describe LogIn do
	
	before :each do
		EmployeeUsernames.set_up_file("example_employee_usernames.yml")
	  EmployeesList.set_up_admin_list("example_admin_employees_list.yml")
	end

	it "should not raise an error if an admin selects an admin-only option." do
		example_login = LogIn.new
		example_login.get_admin_list("example_admin_employees_list.yml")
		allow(TimeLog).to receive(:admin_options) {6}
	  expect { example_login.log_in('ilovecabbage') }.to raise_error(Errors::ArgumentError)
	end

  it "should raise an error if a non-admin selects an admin-only option." do
		example_login = LogIn.new
		allow(TimeLog).to receive(:non_admin_options) {4}
	  expect { example_login.log_in('janeiscool') }.to raise_error(Errors::ArgumentError)
	end

end
