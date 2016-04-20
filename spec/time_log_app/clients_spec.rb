require_relative '../../time_log_app/clients'

describe Clients do

  it "lets you add a new client" do
	  example = Clients.new
		example.add_new_client('NewCompany')
		expect(example.list).to include('NewCompany')
	end
  
	it "lets you add a new client" do
	  example = Clients.new
		example.add_new_client('OldCompany')
		example.add_new_client('NewCompany')
		expect(example.list).to include('NewCompany', 'OldCompany')
	end

	it "lets you add a new client" do
	  example = Clients.new
		example.add_new_client('OldCompany')
		example.add_new_client('NewCompany')
		expect(example.list.length).to eq(2)
	end

end


