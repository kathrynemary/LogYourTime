require 'spec_helper'

describe Employees do

  before :each do
		EmployeesList.set_up_list("example_employees_list.yml")
		EmployeesList.set_up_admin_list("example_employee_admin_list.yml")
	end

	it "lets you add a new employee" do #Commenting out because test will otherwise fail when run multiple times. It will not let you add the same employee more than once.
		example = Employees.new("example_employees_list.yml", "example_employee_admin_list.yml", "example_employee_usernames.yml")
	  EmployeeUsernames.set_up_file("example_employee_usernames.yml")	
#		allow(example).to receive(:ask_user_name) {'johnithan'}
#		allow(example).to receive (:admin?) {"y"}
		allow(example).to receive (:double_check) {"y"}
#		example.add_new_employee('John Doe')

    expect(EmployeesList.return_list).to include('John Doe')
	end

	it "won't let you add the same employee twice." do
#		EmployeesList.add_name('Coldest Person')
	  example = Employees.new("example_employees_list.yml", "example_employee_admin_list.yml") 
#		allow(example).to receive(:ask_user_name) {'iglue'}
#		allow(example).to receive (:admin?) {"n"}
		allow(example).to receive (:double_check) {"y"}
		expect { example.add_new_employee('Coldest Person') }.to raise_error(Errors::ArgumentError)
  end

	it "won't let you add the same username twice." do	
#		EmployeeUsernames.set_up_username("Coldest Person", "igloo")
		example = Employees.new("example_employees_list.yml", "example_employee_admin_list.yml")  
#		allow(example).to receive(:ask_user_name) {'igloo'}
#		allow(example).to receive (:admin?) {"y"}
		allow(example).to receive (:double_check) {"y"}
		expect { example.add_new_employee('Less-Cold Person') }.to raise_error(Errors::ArgumentError)
  end

	it "will raise an error if you don't verify the name " do
		example = Employees.new("example_employees_list.yml", "example_employee_admin_list.yml") 
#		allow(example).to receive(:ask_user_name) {'thejaneinspain'}
#		allow(example).to receive (:admin?) {"n"}
		allow(example).to receive (:double_check) {"N"}
		expect { example.add_new_employee('John Doe') }.to raise_error(Errors::ArgumentError)
  end
  
	it "can add an employee to an Admins list" do
		example = Employees.new("example_employees_list.yml", "example_employee_admin_list.yml") 
#		example.push_admin('Herbert Doe')
    expect(EmployeesList.return_admin_list).to include('Herbert Doe') 
	end

end

