require 'spec_helper'

describe LogIn do
	
	before :each do
		EmployeeUsernames.set_up_file("example_employee_usernames.yml")
	  EmployeesList.set_up_admin_list("example_employee_admin_list.yml")
	end

  it "should raise an error if a non-admin selects an admin-only option." do
		example_login = LogIn.new
		allow(TimeLog).to receive(:non_admin_options) {4}
	  expect { example_login.log_in('janeiscool') }.to raise_error(Errors::ArgumentError)
	end

end
