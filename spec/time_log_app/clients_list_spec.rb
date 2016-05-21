require 'spec_helper'

describe ClientsList do

  before :each do
		ClientsList.set_up_list("spec/spec_data_files/example_clients_list_clients_list.yml")
		ClientsList.add_name('MegaCorp')
		ClientsList.add_name('MinorCorp')
	end

	it "returns both clients" do
    ClientsList.set_up_list("spec/spec_data_files/example_clients_list_clients_list.yml")
		expect(ClientsList.get_list.values.flatten).to include('MegaCorp')
		expect(ClientsList.get_list.values.flatten).to include('MinorCorp')
	end

end


