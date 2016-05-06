require 'spec_helper'

describe CalculateHours do

  it "should return the difference in time" do
		example = CalculateHours.new
		example.start_time("April 1 2016 8:00") 
		example.end_time("April 1 2016 12:00")
		example.calculate_hours
		expect(example.hours).to eq(4)
	end

  it "should return the difference in time" do
		example = CalculateHours.new
		example.start_time("April 1 2016 8:00") 
		example.end_time("April 1 2016 12:30")
		example.calculate_hours
		expect(example.hours).to eq(4)
		expect(example.minutes).to eq(30)
	end
  
	it "should return an error for a start time after an end time" do
		example = CalculateHours.new
		example.start_time("April 2 2016 8:00") 
		example.end_time("April 1 2016 12:30")
	  expect { example.calculate_hours }.to raise_error(Errors::ArgumentError) 
	end

end

