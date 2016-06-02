#The files for test/example data are located in the spec/spec_data_files folder.
#Each filename starts with "example" followed by the name of the class being tested,
#then the file's normal name. 
#Lines are commented out so that they will not persist the same data each time the test is run.

require 'spec_helper'

describe Employees do

	it "raises an error for a name that is already in use." do
		expect { Employees.new.name_already_in_use }.to raise_error{ |error|
			expect(error).to be_a(Errors::DuplicateNameError)
		}
  end

	it "lets you add a new employee" do 
    EmployeesList.set_up_list("spec/spec_data_files/example_employees_employees_list.yml")
		EmployeesList.set_up_admin_list("spec/spec_data_files/example_employees_employee_admin_list.yml")
	  EmployeeUsernames.set_up_list("spec/spec_data_files/example_employees_employee_usernames.yml")
		example = Employees.new("spec/spec_data_files/example_employees_employees_list.yml")
		allow(example).to receive (:double_check) {"Y"}
		allow(example).to receive(:get_user_name) {'johnithan'}
		allow(example).to receive (:admin?) {"y"}
		#example.add_new_employee('Johnithan Doe')
    expect(EmployeesList.return_list).to include('Johnithan Doe')
	end

end

