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
    
		expect(EmployeeUsernamesList.employee"example").to eq('John Doe')
	end

	it "won't let you add the same username twice." do	
		EmployeeUsernamesList.set_up_username("Coldest Person", "igloo")
		allow(EmployeeUsernames).to receive(:ask_user_name) {'igloo'}
		allow(EmployeeUsernames).to receive (:double_check) {"y"}
		expect { EmployeeUsernames.set_up_username('Less-Cold Person') }.to raise_error(Errors::ArgumentError)
  end

end


