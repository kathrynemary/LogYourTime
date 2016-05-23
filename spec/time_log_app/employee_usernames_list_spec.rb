require 'spec_helper'

describe EmployeeUsernamesList do

	it "returns a username for john" do
		EmployeeUsernames.set_up_file("spec/spec_data_files/example_employee_usernames_employee_usernames.yml")	
    #EmployeeUsernames.set_up_username("John Doe", "johnnyboy")

		expect(EmployeeUsernames.username('John Doe')).to eq('johnnyboy')
	end
  
  it "returns an employee for a John's username" do 
		expect(EmployeeUsernames.employee('johnnyboy')).to eq('John Doe')
	end
	
	it "returns a username for Jane" do
		EmployeeUsernames.set_up_file("spec/spec_data_files/example_employee_usernames_employee_usernames.yml")	
		EmployeeUsernames.set_up_username('Jane Doe', 'janeiscool')  
		
		expect(EmployeeUsernames.username('Jane Doe')).to eq('janeiscool')
	end

end

