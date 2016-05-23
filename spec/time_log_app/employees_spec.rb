require 'spec_helper'

describe Employees do

  before :each do
    EmployeesList.set_up_list("spec/spec_data_files/example_employees_employees_list.yml")
		EmployeesList.set_up_admin_list("spec/spec_data_files/example_employees_employee_admin_list.yml")
	end

	it "lets you add a new employee" do 
		example = Employees.new("spec/spec_data_files/example_employees_employees_list.yml")
		allow(example).to receive (:double_check) {"Y"}
		allow(example).to receive(:ask_user_name) {'johnithan'}
		allow(example).to receive (:admin?) {"y"}
		#example.add_new_employee('Johnithan Doe')
    expect(EmployeesList.return_list).to include('Johnithan Doe')
	end

	it "won't let you add the same employee twice." do
#		EmployeesList.add_name('Coldest Person')
	  example = Employees.new("spec/spec_data_files/example_employees_employees_list.yml") 
#		allow(example).to receive(:ask_user_name) {'iglue'}
#		allow(example).to receive (:admin?) {"n"}
		allow(example).to receive (:double_check) {"y"}
		expect { example.add_new_employee('Coldest Person') }.to raise_error(Errors::ArgumentError)
  end

	it "will raise an error if you don't verify the name" do
		example = Employees.new("spec/spec_data_files/example_employees_employees_list.yml") 
		allow(example).to receive(:ask_user_name) {'thejaneinspain'}
		allow(example).to receive (:admin?) {"n"}
		allow(example).to receive (:double_check) {"N"}
		expect { example.add_new_employee('John Doe') }.to raise_error(Errors::ArgumentError)
  end
end

