require_relative '../../time_log_app/time_log_input_synthesizer'

describe EventInputSynthesizer do
  before :each do
#		@type = WorkTypeInterface.new
    
#		@start = TimeInputInterface.new
#		allow(@start).to receive(:ask_time) {"8:00"}
#		allow(@start).to receive(:ask_date) {"April 1 2016"}
    
		#@end = TimeInputInterface.new
		#allow(@end).to receive(:ask_time) {"12:00"}
		#allow(@end).to receive(:ask_date) {"April 1"}
=begin		
		employees = Employees.new
		employees.add_new_employee('John Doe')
		employees.add_new_employee('Jane Doe')
		@employee = NameInputInterface.new(EmployeesList)
    allow(@employee).to receive(:ask_name) {"John Doe"}

		clients = Clients.new
		clients.add_new_client('MegaCorp')
		clients.add_new_client('MinorCorp')
		@client = NameInputInterface.new(ClientsList.list)
    allow(@client).to receive(:ask_name) {"MegaCorp"}
    allow(@client).to receive(:verify_input) {"Y"}
=end
		@example = EventInputSynthesizer.new
   # @start.get_date_and_time
	end
  
  it "should return the correct work type" do
    allow(@example).to receive(:ask_timecode) {"1"}
	  @example.get_work_type
		expect(@example.work_type).to eq('billable')
	end
	
#	it "should format employee input into a master input" do	
#  it "should format client input into a master input" do
#  it "should format start time input into a master input" do
#	it "should accept a client name" do
end

#take input from time interface, name interface, for employee, client, start time, end time, work type.
#calculate hours_worked (from time_log_master)
#make sure start_time is before end_time
#can't submit a log for the same time twice. (here or elsewhere?)
