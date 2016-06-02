require 'spec_helper'

describe CalculateHours do

  it "should return the difference in time" do
		example = CalculateHours.new("April 1 2016 8:00", "April 1 2016 12:00")
		example.calculate_hours
		expect(example.total_minutes).to eq(240)
	end

  it "should return the difference in time" do
		example = CalculateHours.new("April 1 2016 8:00", "April 1 2016 12:30")
		example.calculate_hours
		expect(example.total_minutes).to eq(270)
	end
  
	it "should return an error for a start time after an end time" do
	  expect { CalculateHours.new.wrong_time_input }.to raise_error{ |error|
			expect(error).to be_a(StandardError)
		}	
	end

end

