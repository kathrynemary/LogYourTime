require_relative '../../time_log_app/name_event_input_interface'

describe NameInputInterface do

  context "for employees" do 
		before :each do
			employees = Employees.new
			employees.add_new_employee('John Doe')
			employees.add_new_employee('Jane Doe')
			@example = NameInputInterface.new(EmployeesList.list)	
		end

		it "excludes the partial names of employees" do
			expect(EmployeesList.list).not_to include('John')
		end

		it "should accept input to select an employee" do
			allow(@example).to receive(:ask_name) {"Jane Doe"}
			allow(@example).to receive(:verify_input) {"Y"}
			@example.get_name
		  expect(@example.selection).to eq("Jane Doe")
		end

    it "should raise an error or incorrect input" do
			allow(@example).to receive(:ask_name) {"Methuselah"}
			expect { @example.get_name }.to raise_error(Errors::ArgumentError)
		end
	end

  context "for clients" do 
		before :each do
			@clients = Clients.new
			@clients.add_new_client('MegaCorp')
			@clients.add_new_client('MinorCorp')
			@example = NameInputInterface.new(ClientsList.list)	
		end

		it "knows the clients' names" do
			expect(@example.list_names).to include('MinorCorp')
		end

		it "excludes the names of non-clients" do
			expect(@example.list_names).not_to include('John Doe')
		end
		
		it "excludes the partial names of clients" do
			expect(@example.list_names).not_to include('Corp')
		end
		
		it "should accept input to select a client" do
			allow(@example).to receive(:ask_name) {"MegaCorp"}
			@example.get_name
		  expect(@example.selection).to eq("MegaCorp")
		end

    it "should raise an error or incorrect input" do
			allow(@example).to receive(:ask_name) {"Methuselah"}
			expect { @example.get_name }.to raise_error(Errors::ArgumentError)
		end
  end

end
