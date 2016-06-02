require 'spec_helper'

describe TimeLogClientTotals do

  before :each do
		ClientsList.set_up_list("spec/spec_data_files/example_time_log_client_totals_clients_list.yml")
#		ClientsList.add_name('ExampleCompany')
#		ClientsList.add_name('AnotherCompany')
  	
		TimeLog.set_up("Special Person", "spec/spec_data_files/example_time_log_client_totals_events.yml")
		TimeLog.set_start_time("#{FindCurrentMonth.get_date}, 10:30")
		TimeLog.set_end_time("#{FindCurrentMonth.get_date}, 13:10")
    TimeLog.set_work_type("billable")
		TimeLog.set_client("ExampleCompany")
    TimeLog.calculate_time_worked
#		TimeLog.write_to_log

  	TimeLog.set_up("Unspecial Person", "spec/spec_data_files/example_time_log_client_totals_events.yml")
		TimeLog.set_start_time("#{FindCurrentMonth.get_date}, 10:30")
		TimeLog.set_end_time("#{FindCurrentMonth.get_date}, 12:30")
    TimeLog.set_work_type("billable")
		TimeLog.set_client("AnotherCompany")
    TimeLog.calculate_time_worked
#		TimeLog.write_to_log

	end

	it "should return the total minutes for examplecompany" do
    TimeLogClientTotals.get_client_minutes_worked("ExampleCompany", "spec/spec_data_files/example_time_log_client_totals_events.yml")
		expect(TimeLogClientTotals.total_minutes).to eq(160)
	end

	it "should return correct sum for anothercompany" do
    TimeLogClientTotals.get_client_minutes_worked("AnotherCompany", "spec/spec_data_files/example_time_log_client_totals_events.yml")
		expect(TimeLogClientTotals.sum).to eq("2 hours and 0 minutes worked.")
	end

end

