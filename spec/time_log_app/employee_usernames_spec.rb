require_relative '../../time_log_app/employee_usernames'

describe EmployeeUsernames do

  before :each do
    example_john = Employees.new
		allow(example_john).to receive(:ask_user_name) {'johnnyboy'}
		allow(example_john).to receive(:double_check) {"y"}
		allow(example_john).to receive(:verify_user_name) {'y'}
    example_john.get_user_name('John Doe')
	end

	it "returns a username for an employee" do
		expect(EmployeeUsernames.username('John Doe')).to eq('johnnyboy')
	end
  
  it "returns an employee for a username" do
		expect(EmployeeUsernames.employee('johnnyboy')).to eq('John Doe')
	end
	
	it "returns a username for an employee, 2nd example" do
		example_jane = Employees.new
		allow(example_jane).to receive(:ask_user_name) {'janeiscool'}
		allow(example_jane).to receive (:double_check) {"y"}
		allow(example_jane).to receive(:admin?).with("Jane Doe") {'N'}
		example_jane.add_new_employee('Jane Doe') 
    expect(EmployeeUsernames.username('Jane Doe')).to eq('janeiscool')
	end

	it "throws an error for an unavailable employee" do
    expect { EmployeeUsernames.username('Donald Duck') }.to raise_error(Errors::ArgumentError)
	end

	it "throws an error for an unavailable username" do
    expect { EmployeeUsernames.employee('ducks_r_cool') }.to raise_error(Errors::ArgumentError)
	end

end
