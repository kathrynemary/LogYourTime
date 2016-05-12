require 'spec_helper'

describe TimeLog do
 
 	before :each do
		TimeLog.new_event('Herbert Doe')
	  TimeLog.stub_new_event
	
		TimeLog.new_event("Jane Doe")
		TimeLog.stub_another_event
	
	end
  
	it "returns the employee" do
		expect(TimeLog.get_event(:client)).to include("MegaCorp")
	end

	#	it "returns the client" do
#		expect(TimeLog.get_event(:event)).to include("MegaCorp")
#	end
	
#	it "returns the work type" do
#		expect(TimeLog.get_event(:event)).to include("work type")
#	end

end

#different files for each employee and client?

#add each event to an events array, then do
#:w
	#	@log[:events] = @events_array
