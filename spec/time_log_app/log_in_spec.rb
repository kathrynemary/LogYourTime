require_relative '../../time_log_app/log_in'

describe LogIn do
	
  before :each do
    @example_john = Employees.new
		allow(@example_john).to receive(:ask_user_name) {'johnnyboy'}
		allow(@example_john).to receive(:double_check) {"y"}
    allow(@example_john).to receive (:admin?) {'n'}
		allow(@example_john).to receive(:verify_user_name) {'y'}
    @example_john.add_new_employee('John Doe') 

		@example_herb = Employees.new
		allow(@example_herb).to receive(:ask_user_name) {'ilovecabbage'}
		allow(@example_herb).to receive (:double_check) {"y"}
    allow(@example_herb).to receive (:admin?) {'y'}
		@example_herb.push_admin('Herbert Doe')
		@example_herb.add_new_employee('Herbert Doe')

	end

	it "gets the employee from a username" do
	  example_login = LogIn.new('johnnyboy')  
		expect(example_login.employee).to eq("John Doe")
	end

  it "should offer more options to an admin" do
		example_login = LogIn.new('ilovecabbage')  
		allow(example_login).to receive(:admin_options) {"1"} 
 		expect(example_login.display_options).to eq('log time')
	end

  it "should let an admin add a new employee" do
		example_login = LogIn.new('ilovecabbage')  
		allow(example_login).to receive(:admin_options) {"3"} 
 		expect(example_login.display_options).to receive('add_employee')
	end

end
