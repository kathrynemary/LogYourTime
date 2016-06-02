#The files for test/example data are located in the spec/spec_data_files folder.
#Each filename starts with "example" followed by the name of the class being tested,
#then the file's normal name. 
#Lines are commented out so that they will not persist the same data each time the test is run.

require 'spec_helper'

describe EmployeeUsernames do

  before :each do
    EmployeeUsernamesList.set_up_file("spec/spec_data_files/example_employee_usernames_employee_usernames_list.yml")
    EmployeeUsernames.set_up_list("spec/spec_data_files/example_employee_usernames_employee_usernames_list.yml")
	end

	it "lets you add a new employee and username" do 
		allow(EmployeeUsernames).to receive (:ask_user_name) {"example"}
		allow(EmployeeUsernames).to receive (:double_check_user) {"y"}
	 	#EmployeeUsernames.set_up_username("John Doe")    
		expect(EmployeeUsernamesList.employee("example")).to eq('John Doe')
	end

	it "raises an error if the username is already in use" do
		expect { EmployeeUsernames.new.already_in_use }.to raise_error{ |error|
			expect(error).to be_a(StandardError)
		}	
  end

end


