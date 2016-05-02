require_relative '../../time_log_app/time_log_master'
require_relative '../../time_log_app/log_writer'

describe TimeLog do
  before :each do
	  @example = TimeLog.new('John Doe') 
	end

  it "should send the event to the file writer" do
    expect(FileWriter).to include {'John Doe'}
	end

end
