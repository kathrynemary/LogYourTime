require 'spec_helper'

describe TimeLogReader do

  before :each do
	  TimeLogReader.get_events("Jane Doe", "example_events.yml")	
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
	
	it " " do
	end

end

