require 'spec_helper'

describe TimeLog do
	
	it "should throw an error if you try to submit a log for the same time twice" do
  	TimeLog.set_up("John Doe", "example_events.yml")
		allow(TimeLog).to receive(:client) {"MegaCorp"}  
		allow(TimeLog).to receive(:work_type) {"billable"}  
		allow(TimeLog).to receive(:minutes_worked) {120}  
		allow(TimeLog).to receive(:end_time) {"may 1, 2016 10:00"}  
		allow(TimeLog).to receive(:start_time) {"may 1, 2016 8:00"}  
		allow(TimeLog).to receive(:employee) {"John Doe"} 	
		TimeLog.write_to_log

		TimeLog.set_up("John Doe", "example_events.yml")
	  allow(TimeLog).to receive(:start_time) {"may 1, 2016 8:00"} 
		allow(TimeLog).to receive(:end_time) {"may 1, 2016 10:00"} 
		expect { TimeLog.check_times }.to raise_error(Errors::ArgumentError)
	end

 #	before :each do
	#	TimeLog.new_event('Herbert Doe')
	 # TimeLog.stub_new_event
	
#		TimeLog.new_event("Jane Doe")
#		TimeLog.stub_another_event
	
#	end

#	it "returns the work type" do
#		expect(TimeLog.get_event(:event)).to include("work type")
#	end
  
#	def self.stub_another_event
#	  @start_time = "October 3 2015, 10:30"
#		@end_time = "October 3 2015, 12:30"
 #   @work_type = "billable"
	#	@client = "MegaCorp"
   # @minutes_worked = 120
#		write_to_log
#	end

#	def self.stub_new_event
#	  @start_time = "April 26 2016, 9:00"
#		@end_time = "April 26 2016, 10:00"
 #   @work_type = "billable"
	#	@client = "AnonyCorp"
#    @minutes_worked = 60
#		write_to_log
#	end

end

