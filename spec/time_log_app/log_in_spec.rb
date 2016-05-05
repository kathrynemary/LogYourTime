require 'spec_helper'

describe LogIn do
	
  before :each do
    @example_john = Employees.new
		allow(@example_john).to receive(:ask_user_name) {'johnnyboy'}
		allow(@example_john).to receive(:double_check) {"y"}
    allow(@example_john).to receive (:admin?) {'n'}
		allow(@example_john).to receive(:verify_user_name) {'y'}
    @example_john.add_new_employee('John Doe') 

		@example_herb = Employees.new
		allow(@example_herb).to receive(:ask_user_name) {'ilovecabbage'}
		allow(@example_herb).to receive (:double_check) {"y"}
    allow(@example_herb).to receive (:admin?) {'y'}
		@example_herb.push_admin('Herbert Doe')
		@example_herb.add_new_employee('Herbert Doe')

	end

	it "gets the employee from a username" do
		@example_employees = Employees.new
		allow(@example_employees).to receive (:double_check) {"Y"}
    allow(@example_employees).to receive (:admin?) {'y'}
		allow(@example_employees).to receive(:ask_user_name) {"johnnyboy"}
		@example_employees.add_new_employee('John Doe')
	  example_login = LogIn.new('johnnyboy')  
		expect(example_login.employee).to eq("John Doe")
	end

  it "should let an admin run totals by employee" do
		example_login = LogIn.new('ilovecabbage')  
		allow(example_login).to receive(:admin_options) {"6"} 
 		expect(example_login.display_options).to eq('run monthly totals by client')
	end

end
