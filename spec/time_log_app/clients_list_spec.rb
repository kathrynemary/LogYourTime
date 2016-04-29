require_relative '../../time_log_app/clients_list'

describe Clients do

  it "will return list of added clients" do
		example_clients = Clients.new
		example_clients.add_new_client('MegaCorp')
    expect(ClientsList.list).to include('MegaCorp')
	end

	it "returns both clients" do
	  example = Clients.new
		example.add_new_client('MinorCorp')
		expect(ClientsList.list).to include('MegaCorp', 'MinorCorp')
	end

end


