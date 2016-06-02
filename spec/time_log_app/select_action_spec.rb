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


