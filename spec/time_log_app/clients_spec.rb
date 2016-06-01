require 'spec_helper'

describe Clients do
 
  before :each do
		ClientsList.set_up_list("spec/spec_data_files/example_clients_clients_list.yml")
	end

	it "redirects bad input" do
    expect { Clients.new.invalid_input }.to raise_error(Errors::DuplicateNameError)
		#expect { Clients.new.invalid_input }.to raise_error { |error|
		#	expect(error).to be_a(Errors::StandardError::DuplicateNameError)
		#}
	end
	
	it "lets you add 2 new clients" do
	  example = Clients.new("spec/spec_data_files/example_clients_clients_list.yml")
#    example.add_new_client('NewCompany')
		allow(example).to receive (:double_check) {"y"}
#		example.add_new_client('OldCompany')
		allow(example).to receive (:double_check) {"y"}
		expect(ClientsList.get_list.values.flatten).to include('NewCompany', 'OldCompany')
	end
  
end

