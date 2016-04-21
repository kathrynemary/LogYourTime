require_relative '../../time_log_app/time_log_master'
require_relative '../../time_log_app/log_writer'

describe TimeLog do
  before :each do
	  @example = TimeLog.new 
		@example.add_new_event("John Doe", 8, 4, 'billable', 'NewCorp')
	end
  
	it "should let you add a new event" do
		expect(@example.log.length).to eq(6)  
	end

  it "should send the event to the file writer" do
    expect(FileWriter).to include {8}
	end

  it "should calculate time worked" do
    expect(@example.calculate_hours_worked(4, 12)).to eq(8)
	end

  it "should convert start_time" do #extract to interface?
    @example.enter_start_time(2016)
		expect(@example.start_time.year).to eq(2016)
	end

	it "should convert end_time" do #extract to interface?
    @example.enter_end_time(2016)
		expect(@example.end_time.year).to eq(2016)
	end

end

#in interface class
#put in start and end times/dates
#convert the input for start and end times to DateTime
#don't let ppl put in a time that is after the current time
#raise error given incorrect format input
#when they enter their name, display and ask if it's correct, and save only after confirmation
#check to make sure there's only 1 employee of that name
#they can't submit a time log for the same time twice
#want to tie the event to the employee and client
#options for the types of work
