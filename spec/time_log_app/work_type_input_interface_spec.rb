require_relative '../../time_log_app/work_type_input_interface'

describe WorkTypeInterface do

  before :each do
	  @example = WorkTypeInterface.new
	end

  it "should have 3 options for types of work" do
	  codes = ['billable', 'non-billable', 'paid time off']
		expect(codes).to include(@example.select_timecode('1'))
		expect(codes).to include(@example.select_timecode('2'))
		expect(codes).to include(@example.select_timecode('3'))
	end

  it "should accept input to select billable timecode" do
		allow(@example).to receive(:ask_timecode) {"1"}
	  @example.get_timecode
		expect(@example.timecode).to eq('billable')
	end

  it "should accept input to select non-billable timecode" do
		allow(@example).to receive(:ask_timecode) {'2'}
	  @example.get_timecode
		expect(@example.timecode).to eq('non-billable')
	end

  it "should accept input to select pto timecode" do
		allow(@example).to receive(:ask_timecode) {'3'}
	  @example.get_timecode
		expect(@example.timecode).to eq('paid time off')
	end

  it "should raise an error for invalid timecode input" do
		allow(@example).to receive(:ask_timecode) {4}
		expect { @example.get_timecode }.to raise_error(Errors::ArgumentError)
	end

end

#separate thing that takes all the input from the interface classes and passes it to time_log_master

