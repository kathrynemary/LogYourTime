require 'spec_helper'

describe LogIn do
	
	before :each do
		EmployeeUsernames.set_up_file("example_employee_usernames.yml")
	  EmployeesList.set_up_admin_list("example_admin_employees_list.yml")
	end

	it "should not raise an error if an admin selects an admin-only option." do
		example_login = LogIn.new
	  example_login.set_employee('ilovecabbage')
		example_login.check_admin_list("example_admin_employees_list.yml")
		expect(example_login.is_admin).to eq(true)
	end

  it "should raise an error if a non-admin selects an admin-only option." do
		example_login = LogIn.new
		allow(example_login).to receive(:non_admin_options) {4}
	  expect { example_login.log_in('janeiscool') }.to raise_error(Errors::ArgumentError)
	end

end
