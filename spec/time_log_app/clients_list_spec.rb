require 'spec_helper'

describe ClientsList do

  before :each do
#		@example = Clients.new
#		allow(@example).to receive (:double_check) {"Y"}
#    allow(@example).to receive (:verify_input) {'y'}
#		@example.add_new_client('MegaCorp')
		
#		@other_example = Clients.new
#		allow(@other_example).to receive (:double_check) {"Y"}
#    allow(@other_example).to receive (:verify_input) {'y'}
#		@other_example.add_new_client('MinorCorp')
	end

	it "returns both clients" do
    ClientsList.set_up_list("example_clients_list.yml")
		expect(ClientsList.get_list.values.flatten).to include('MegaCorp')
		expect(ClientsList.get_list.values.flatten).to include('MinorCorp')
	end

end


