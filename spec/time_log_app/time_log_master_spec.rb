require_relative '../../time_log_app/time_log_master'

describe TimeLog do
 
 	before :each do
    allow(@example).to receive(:get_start_time) {"April 1, 8:00"}
		allow(@example).to receive(:end_time) {"April 1, 12:00"}
		allow(TimeInputInterface).to receive(:ask_date) {"April 1"}

  allow(WorkTypeInterface).to receive(:ask_timecode) {"1"}

  allow(NameInputInterface).to receive(:ask_name) {"MegaCorp"}
		@example = TimeLog.new('John Doe')	
	end

#  it "should calculate hours worked" do
#		@example.calculate_hours_worked
#    expect(@example.hours_worked).to eq(4)
#	end

  it "should return start time" do
    expect(@example.start_time).to eq("April 1, 8:00")
	end

  it "should return the event" do
    @example.add_new_event
	  expect(@example.get_events).to include('8:00')
	end

end

#error-handling for hours worked
#
#get start time
#get end time
#calculate hours worked (new class?)
#get work type
#check if needs client, then get client
#synthesize info
#write to log
#
#read from log, at least for purposes of testing
