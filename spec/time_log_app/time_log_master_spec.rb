require_relative '../../time_log_app/time_log_master'

describe TimeLog do
 
 	before :each do
		TimeLog.new_event('John Doe')
	  TimeLog.stub_new_event
	end
  
	it "returns the employee" do
		expect(TimeLog.get_event(:employee)).to include("John Doe")
	end

	it "returns the client" do
		expect(TimeLog.get_event(:client)).to include("MegaCorp")
	end
	
	it "returns the work type" do
		expect(TimeLog.get_event(:work_type)).to include("billable")
	end

end







