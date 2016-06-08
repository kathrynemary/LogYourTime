require 'spec_helper'

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

  it "should redirect from the wrong_input method" do
    allow(@example).to receive(:ask_timecode) {'3'}

    output = capture_standardout do
      @example.wrong_timecode_input
      expect(@example.timecode).to eq('paid time off') 
    end
  end

end


