require 'spec_helper'

describe StartMenu do

  it "should count the employees" do
    example = StartMenu.new
		expect(example.list_length).to eq(103)
	end

  it "should go to the log-in menu" do
    example = StartMenu.new
		expect(example.pick_a_side).to receive(example.log_in_menu)
	end

end
