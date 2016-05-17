require 'spec_helper'

describe TimeLogClientTotals do

	it "should return the time for megacorp" do
    TimeLogClientTotals.get_client_minutes_worked("MegaCorp", "example_events.yml")
		expect(TimeLogClientTotals.total_minutes).to eq(60)
	end

	it "should return this month's events for the client MegaCorp" do
		TimeLogClientTotals.get_client_events("MegaCorp", "example_events.yml")
		expect(TimeLogClientTotals.client_events.length).to eq(1)
	end
	
	it "should return the time for megacorp" do
    TimeLogClientTotals.get_client_minutes_worked("MegaCorp")
		expect(TimeLogClientTotals.total_minutes).to eq(60)
	end

	it "should return correct sum for megaCorp" do
		expect(TimeLogClientTotals.sum).to eq("1 hours and 0 minutes worked.")
	end

end

