require 'spec_helper'

describe TimeLogTotals do

  it "should display the start time" do
		TimeLogTotals.get_start_time
    expect(TimeLogTotals.start).to eq("May 3 2016, 9:30")
  end	

	it "should return correct hours for jane" do
		TimeLogTotals.employee_totals("Jane Doe")
    expect(TimeLogTotals.sum).to eq("4 hours and 20 minutes worked.")
	end

end
