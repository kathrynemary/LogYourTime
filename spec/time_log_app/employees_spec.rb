require_relative '../../time_log_app/employees'

describe Employees do

  it "lets you add a new employee" do
		example = Employees.new
		example.add_new_employee('John Doe')
    expect(example.list).to include('John Doe')
	end

	it "lets you 2 new employees" do
	  example = Employees.new
		example.add_new_employee('John Doe')
		example.add_new_employee('Jane Doe')
		expect(example.list).to include('John Doe', 'Jane Doe')
	end

end


