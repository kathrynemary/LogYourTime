require 'spec_helper'

describe TimeLogReader do

  before :each do
  	TimeLog.set_up("John Doe", "example_events.yml")
		allow(TimeLog).to receive(:client) {"MegaCorp"}  
		allow(TimeLog).to receive(:work_type) {"billable"}  
		allow(TimeLog).to receive(:minutes_worked) {120}  
		allow(TimeLog).to receive(:end_time) {"May 1, 2016 10:00"}  
		allow(TimeLog).to receive(:start_time) {"May 1, 2016 8:00"}  
		allow(TimeLog).to receive(:employee) {"John Doe"} 	
		TimeLog.write_to_log
	  TimeLogReader.get_events("John Doe", "example_events.yml")	
	end

	it "gets the current month" do
		TimeLogReader.get_current_month
    expect(TimeLogReader.month).to eq(5)
		expect(TimeLogReader.year).to eq(2016)
	end
  
	it "gets the event month" do
		TimeLogReader.get_event_month(0)
    expect(TimeLogReader.event_month).to eq(5)
		expect(TimeLogReader.event_year).to eq(2016)
	end
	
	it "filters events for John Doe " do
	  TimeLogReader.get_employee_events("John Doe", "example_events.yml")
		expect(TimeLogReader.filter_by_employee.length).to eq(1)
	end

end

