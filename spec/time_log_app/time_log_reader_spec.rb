require 'spec_helper'

describe TimeLogReader do

  before :each do
  	TimeLog.set_up("Special Person", "spec/spec_data_files/example_time_log_reader_events.yml")
		TimeLog.set_start_time("#{FindCurrentMonth.get_date}, 10:30")
		TimeLog.set_end_time("#{FindCurrentMonth.get_date}, 12:30")
    TimeLog.set_work_type("billable")
		TimeLog.set_client("MegaCorp")
    TimeLog.calculate_time_worked
		TimeLog.write_to_log


		TimeLog.set_up("Unspecial Person", "spec/spec_data_files/example_time_log_reader_events.yml")
		TimeLog.set_start_time("#{FindCurrentMonth.get_date}, 10:30")
		TimeLog.set_end_time("#{FindCurrentMonth.get_date}, 12:30")
    TimeLog.set_work_type("billable")
		TimeLog.set_client("MegaCorp")
    TimeLog.calculate_time_worked
		TimeLog.write_to_log
	end

	it "gets the current month" do
		TimeLogReader.get_current_month
    expect(TimeLogReader.month).to eq(FindCurrentMonth.month)
		expect(TimeLogReader.year).to eq(FindCurrentMonth.year)
	end
  
	it "gets the event month" do
	  TimeLogReader.get_employee_events("Special Person", "spec/spec_data_files/example_time_log_reader_events.yml")	
		TimeLogReader.get_event_month(0)
    expect(TimeLogReader.event_month).to eq(FindCurrentMonth.month)
		expect(TimeLogReader.event_year).to eq(FindCurrentMonth.year)
	end
	
	it "filters events for Special Person" do
	  TimeLogReader.get_employee_events("Special Person", "spec/spec_data_files/example_time_log_reader_events.yml")
		expect(TimeLogReader.filter_by_employee.length).to eq(1)
	end

end


