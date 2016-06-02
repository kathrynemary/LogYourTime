#The files for test/example data are located in the spec/spec_data_files folder.
#Each filename starts with "example" followed by the name of the class being tested,
#then the file's normal name. 
#Lines are commented out so that they will not persist the same data each time the test is run.

require 'spec_helper'

describe EmployeeUsernamesList do

	it "returns a username for john" do
		EmployeeUsernamesList.set_up_file("spec/spec_data_files/example_employee_usernames_employee_usernames.yml")	
    #EmployeeUsernamesList.set_up_username("John Doe", "johnnyboy")

		expect(EmployeeUsernamesList.username('John Doe')).to eq('johnnyboy')
	end
  
  it "returns an employee for a John's username" do 
		expect(EmployeeUsernamesList.employee('johnnyboy')).to eq('John Doe')
	end
	
	it "returns a username for Jane" do
		EmployeeUsernamesList.set_up_file("spec/spec_data_files/example_employee_usernames_employee_usernames.yml")	
		EmployeeUsernamesList.set_up_username('Jane Doe', 'janeiscool')  
		
		expect(EmployeeUsernamesList.username('Jane Doe')).to eq('janeiscool')
	end

end

