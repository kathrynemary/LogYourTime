require 'spec_helper'

describe StartMenu do

	it "gets the employee list length" do
    StartMenu.get_employee_list
		expect(StartMenu.list_length).to eq(0)
	end


end
