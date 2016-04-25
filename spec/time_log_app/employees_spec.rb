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

	it "won't let you add the same employee twice." do
    example = Employees.new
    example.add_new_employee('John Doe')
		expect { example.add_new_employee('John Doe') }.to raise_error(Errors::ArgumentError)
  end

	it "will raise an error if you don't verify the name " do
    example = Employees.new
		allow(example).to receive (:double_check) {"N"}
    example.add_new_employee('John Doe')
		expect { example.add_new_employee('John Doe') }.to raise_error(Errors::ArgumentError)
  end

end

