require 'spec_helper'

describe TimeLog do

  before :each do 
		TimeLog.set_up("Neu Person", "spec/spec_data_files/example_time_log_master_events.yml")
	end

	it "writes to the employees list" do
		TimeLog.set_start_time("May 2 2016, 8:00")
    TimeLog.set_end_time("May 2 2016, 12:00")
		TimeLog.calculate_time_worked
    
		expect(TimeLog.minutes_worked).to eq(240)
	end
 
  it "" do	
    TimeLog.set_start_time("October 3 2015, 10:30")
		TimeLog.set_end_time("October 3 2015, 12:30")
    TimeLog.set_work_type("billable")
		TimeLog.set_client("MegaCorp")
    TimeLog.calculate_time_worked
		TimeLog.synthesize_event
		TimeLog.write_to_log
		expect(TimeLog.minutes_worked).to eq(120)
	end

end

