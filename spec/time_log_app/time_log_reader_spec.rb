require 'spec_helper'

describe TimeLogReader do

	it "lists the events by employee" do
	  TimeLogReader.get_events("Jane Doe")	
		expect(TimeLogReader.tally).to eq(2)
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
	
	it "gets the event month" do
		TimeLogReader.get_event_month(2)
    expect(TimeLogReader.event_month).to eq(10)
		expect(TimeLogReader.event_year).to eq(2015)
	end

	it "checks length" do
		TimeLogReader.get_number_of_events
	  expect(TimeLogReader.tally).to eq(2)
	end

end

#TimeLogReader.get_file("Jane Doe")
#TimeLogReader.update_to_current_month
#puts TimeLogReader.updated_file
#
