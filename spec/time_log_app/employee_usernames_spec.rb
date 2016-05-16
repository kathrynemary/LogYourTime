require 'spec_helper'

describe EmployeeUsernames do

	it "returns a username for john" do
		example_john = Employees.new("example_employees_list.yml", "example_admin_employees_list.yml", "example_employee_usernames.yml")
		allow(example_john).to receive(:ask_user_name) {'johnnyboy'}
		allow(example_john).to receive (:double_check) {"y"}
		allow(example_john).to receive(:admin?).with("John Doe") {'N'}
	  EmployeeUsernames.set_up_file("example_employee_usernames.yml")	
		example_john.add_new_employee('John Doe') 
		
		expect(EmployeeUsernames.username('John Doe')).to eq('johnnyboy')
	end
  
  it "returns an employee for a John's username" do
		example_john = Employees.new("example_employees_list.yml", "example_admin_employees_list.yml", "example_employee_usernames.yml")
		allow(example_john).to receive(:ask_user_name) {'johnnyboy'}
		allow(example_john).to receive (:double_check) {"y"}
		allow(example_john).to receive(:admin?).with("John Doe") {'N'}
		example_john.add_new_employee('John Doe') 
	  
		expect(EmployeeUsernames.employee('johnnyboy')).to eq('John Doe')
	end
	
	it "returns a username for Jane" do
		example_jane = Employees.new("example_employees_list.yml", "example_admin_employees_list.yml", "example_employee_usernames.yml")
		allow(example_jane).to receive(:ask_user_name) {'janeiscool'}
		allow(example_jane).to receive (:double_check) {"y"}
		allow(example_jane).to receive(:admin?).with("Jane Doe") {'N'}
	  EmployeeUsernames.set_up_file("example_employee_usernames.yml")	
		example_jane.add_new_employee('Jane Doe')  
		
		expect(EmployeeUsernames.username('Jane Doe')).to eq('janeiscool')
	end

end

