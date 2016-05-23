require_relative '../../time_log_app/time_input_interface'

describe TimeInputInterface do
	before :each do
		@example = TimeInputInterface.new
	end

	it "should combine date and time input together" do
		allow(@example).to receive(:ask_date) {"september 4th 2015"}
		allow(@example).to receive(:ask_time) {"9:00"}
		@example.get_time_and_date('start')
		expect(@example.date_and_time).to eq("september 4th 2015 9:00")
	end
	
	it "should raise an error or incorrect time input" do
		allow(@example).to receive(:ask_time) {"Methuselah"}
		expect { @example.get_time('start') }.to raise_error(Errors::ArgumentError)
	end

  it "should raise an error for a date in the future" do
    allow(@example).to receive(:ask_date) {"december 10, 2016"}
		allow(@example).to receive(:ask_time) {"8:00"}
    puts Date.today
		expect { @example.get_time_and_date('start') }.to raise_error(Errors::ArgumentError)
	end
end

