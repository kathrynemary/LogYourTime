#The files for test/example data are located in the spec/spec_data_files folder.
#Each filename starts with "example" followed by the name of the class being tested,
#then the file's normal name. 
#Lines are commented out so that they will not persist the same data each time the test is run.

require 'spec_helper'

describe ClientsList do

  before :each do
		ClientsList.set_up_list("spec/spec_data_files/example_clients_list_clients_list.yml")
#		ClientsList.add_name('MegaCorp')
#		ClientsList.add_name('MinorCorp')

	end

	it "returns both clients" do
    output = capture_standardout do
		  ClientsList.get_list.values.flatten
		end
		
		expect(output).to include('MegaCorp')
	  expect(output).to include('MinorCorp')
	end

end


