require_relative '../../time_log_app/name_event_input_interface'

describe NameInputInterface do

  context "for clients" do 
		before :each do
			@example = NameInputInterface.new(ClientsList.get_list)	
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
