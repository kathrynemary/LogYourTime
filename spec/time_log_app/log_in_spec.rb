require 'spec_helper'

describe LogIn do
	
	before :each do
		EmployeeUsernames.set_up_file("example_employee_usernames.yml")
	  EmployeesList.set_up_admin_list("example_employee_admin_list.yml")
	end
	
	it "gets the employee from a username" do
		allow(TimeLog).to receive(:non_admin_options) {3}
		example_login = LogIn.new
		example_login.log_in('johnnyboy')
		expect(example_login.log_in('johnnyboy'))
	end

  it "should raise an error if a non-admin selects an admin-only option." do
		#example_login = LogIn.new
		#allow(example_login).to receive(:employee) {"Jane Doe"}#example_login.log_in('janeiscool')
	  expect { example_login.select_action(4)}.to raise_error(Errors::ArgumentError)
	end

end
