require 'spec_helper'

describe TimeLogClientTotals do

	it "should return this month's events for the client MegaCorp" do
		TimeLogClientTotals.get_client_events("MegaCorp")
    expect(TimeLogClientTotals.client_events.length).to eq(2)
	end
	
	it "should return the events for the client AnonyCorp" do
		TimeLogClientTotals.get_client_events("AnonyCorp")
    expect(TimeLogClientTotals.client_events.length).to eq(1)
	end

	it "should return the time for Anonycorp" do
		TimeLogClientTotals.get_client_minutes_worked("AnonyCorp")
		expect(TimeLogClientTotals.total_minutes).to eq(60)
	end

	it "should return correct sum for AnonyCorp" do
		TimeLogClientTotals.get_client_minutes_worked("AnonyCorp")
		expect(TimeLogClientTotals.sum).to eq("1 hours and 0 minutes worked.")
	end

	it "should return the time for megacorp" do
		TimeLogClientTotals.get_client_minutes_worked("MegaCorp")
		expect(TimeLogClientTotals.total_minutes).to eq(240)
	end

	it "should return correct sum for megaCorp" do
		TimeLogClientTotals.get_client_minutes_worked("MegaCorp")
		expect(TimeLogClientTotals.sum).to eq("4 hours and 0 minutes worked.")
	end

end

