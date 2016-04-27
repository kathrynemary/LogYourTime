require_relative '../../time_log_app/clients'

describe Clients do

  it "lets you add a new client" do
	  example = Clients.new
		example.add_new_client('NewCompany')
		expect(example.list).to include('NewCompany')
	end
  
	it "lets you add 2 new clients" do
	  example = Clients.new
		example.add_new_client('OldCompany')
		example.add_new_client('NewCompany')
		expect(example.list).to include('NewCompany', 'OldCompany')
	end

	it "counts the clients correctly" do
	  example = Clients.new
		example.add_new_client('OldCompany')
		example.add_new_client('NewCompany')
		expect(example.list.length).to eq(2)
	end
	
	it "won't let you add the same client twice." do
	  example = Clients.new
		example.add_new_client('OldCompany')
		expect { example.add_new_client('OldCompany') }.to raise_error(Errors::ArgumentError)
  end

	it "will raise an error if you don't verify the name " do
    example = Clients.new
		allow(example).to receive (:double_check) {"N"}
    example.add_new_client('NewCompany')
		expect { example.add_new_client('NewCompany') }.to raise_error(Errors::ArgumentError)
  end

  it "should add a client to ClientsList" do
		example = Clients.new
		allow(example).to receive (:double_check) {"Y"}
		example.add_new_client('JohnsCompany')
		expect(ClientsList).to include {'JohnsCompany'}
  end
  
end


