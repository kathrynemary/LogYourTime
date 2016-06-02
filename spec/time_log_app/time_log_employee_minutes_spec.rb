#The files for test/example data are located in the spec/spec_data_files folder.
#Each filename starts with "example" followed by the name of the class being tested,
#then the file's normal name. 
#Lines are commented out so that they will not persist the same data each time the test is run.

require 'spec_helper'

describe TimeLogEmployeeMinutes do

  before :each do
    TimeLogReader.get_file("spec/spec_data_files/example_time_log_employee_minutes_employees_list.yml")

		EmployeesList.set_up_list("spec/spec_data_files/example_time_log_employee_minutes_employees_list.yml")
#		EmployeesList.add_name('Colonel Mustard')
#		EmployeesList.add_name('Miss Scarlett')
  	
		TimeLog.set_up("Colonel Mustard", "spec/spec_data_files/example_time_log_employee_minutes_events.yml")
		TimeLog.set_start_time("#{FindCurrentMonth.get_date}, 8:30")
		TimeLog.set_end_time("#{FindCurrentMonth.get_date}, 12:50")
    TimeLog.set_work_type("billable")
		TimeLog.set_client("ExampleCompany")
    TimeLog.calculate_time_worked
		TimeLog.write_to_log

  	TimeLog.set_up("Miss Scarlett", "spec/spec_data_files/example_time_log_employee_minutes_events.yml")
		TimeLog.set_start_time("#{FindCurrentMonth.get_date}, 10:30")
		TimeLog.set_end_time("#{FindCurrentMonth.get_date}, 12:30")
    TimeLog.set_work_type("billable")
		TimeLog.set_client("AnotherCompany")
    TimeLog.calculate_time_worked
		TimeLog.write_to_log

	end
	
	it "should return the total minutes for Miss Scarlett" do
		TimeLogEmployeeMinutes.employee_totals("Miss Scarlett", "spec/spec_data_files/example_time_log_employee_minutes_events.yml")
		expect(TimeLogEmployeeMinutes.total_minutes).to eq(120)
	end
	
	it "should return the correct sum for colonel mustard" do
		TimeLogEmployeeMinutes.employee_totals("Colonel Mustard", "spec/spec_data_files/example_time_log_employee_minutes_events.yml")
    expect(TimeLogEmployeeMinutes.sum).to eq("4 hours and 20 minutes worked.")
	end

end
