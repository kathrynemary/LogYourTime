require 'spec_helper'

describe Clients do
 
	it "lets you add 2 new clients" do
	  example = Clients.new
		allow(example).to receive (:double_check) {"y"}
		example.add_new_client('OldCompany')
		allow(example).to receive (:double_check) {"y"}
		example.add_new_client('NewCompany')
		expect(ClientsList.get_list).to include('NewCompany', 'OldCompany')
	end

	it "won't let you add the same client twice." do
	  example = Clients.new
		allow(example).to receive (:double_check) {"y"}
		example.add_new_client('OldCompany')
		expect { example.add_new_client('OldCompany') }.to raise_error(Errors::ArgumentError)
  end

	it "will raise an error if you don't verify the name " do
    example = Clients.new
		allow(example).to receive (:double_check) {"N"}
    example.add_new_client('NewCompany')
		expect { example.add_new_client('NewCompany') }.to raise_error(Errors::ArgumentError)
  end
  
end


