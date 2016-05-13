require 'spec_helper'

describe TimeLogClientTotals do

	it "should return the events for may 2016" do
		TimeLogClientTotals.get_client_events("MegaCorp")
    expect(TimeLogClientTotals.client_events.length).to eq(3)
	end

end

#get the events for the month
#get the client
#get the minutes_worked for those events
#add up the minutes_worked and return that
#
#may anonycorp
#may megacorp
#may megacorp
#oct megacorp
