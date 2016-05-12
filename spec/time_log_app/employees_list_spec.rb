require 'spec_helper'

describe EmployeesList do

  before :each do
		@example_employees = Employees.new
		allow(@example_employees).to receive (:double_check) {"Y"}
    allow(@example_employees).to receive (:admin?) {'y'}
		allow(@example_employees).to receive(:ask_user_name) {"hello"}
		@example_employees.add_new_employee('John Doe')

		@example = Employees.new
		allow(@example).to receive (:double_check) {"Y"}
    allow(@example).to receive (:admin?) {'y'}
		allow(@example).to receive(:ask_user_name) {"it's_me"}
		@example.add_new_employee('Jane Doe')
		
		@example_admin = Employees.new
		allow(@example_admin).to receive (:double_check) {"Y"}
    allow(@example_admin).to receive (:admin?) {'y'}
		allow(@example_admin).to receive(:ask_user_name) {"it's_me"}
		@example_admin.push_admin('Herbert Doe')
		@example_admin.add_new_employee('Herbert Doe')
	end

  it "will return list of added employees" do
    expect(EmployeesList.return_list).to include('John Doe')
	end

	it "returns both employees" do
    expect(EmployeesList.return_list).to include('John Doe', 'Jane Doe')
	end

	it "will tell you which are admins" do
    expect(EmployeesList.return_admin_list).to include('Herbert Doe') 
	end

end

