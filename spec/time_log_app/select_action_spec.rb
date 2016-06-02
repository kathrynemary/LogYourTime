#The files for test/example data are located in the spec/spec_data_files folder.
#Each filename starts with "example" followed by the name of the class being tested,
#then the file's normal name. 
#Lines are commented out so that they will not persist the same data each time the test is run.

require 'spec_helper'

describe DisplayOptions do
	
	before :each do
		EmployeesList.set_up_list("spec/spec_data_files/example_select_action_employees_list.yml")
		#EmployeesList.add_name("Ron Swanson")
		
	end

  it "should get the time ron has worked this month" do
    example = SelectAction.new("Ron Swanson")
		example.selection('2')
	 	expect(example.sum).to eq("0 hours and 0 minutes worked.")
	end

end


