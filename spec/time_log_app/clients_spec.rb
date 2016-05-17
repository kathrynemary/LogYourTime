require 'spec_helper'

describe Clients do
 
  before :each do
		ClientsList.set_up_list("example_clients_list.yml")
	end

	it "lets you add 2 new clients" do
	  example = Clients.new("example_clients_list.yml")
		allow(example).to receive (:double_check) {"y"}
#    example.add_new_client('NewCompany')
		allow(example).to receive (:double_check) {"y"}
#		example.add_new_client('OldCompany')
	expect(ClientsList.get_list).to include('NewCompany', 'OldCompany')
	end

	it "won't let you add the same client twice." do
  	example = Clients.new("example_clients_list.yml")
		allow(example).to receive (:double_check) {"y"}
		expect { example.add_new_client('OldCompany') }.to raise_error(Errors::ArgumentError)
  end

	it "will raise an error if you don't verify the name " do
  	example = Clients.new("example_clients_list.yml")
		allow(example).to receive (:double_check) {"N"}
		expect { example.add_new_client('New') }.to raise_error(Errors::ArgumentError)
  end
  
end


