require_relative '../../time_log_app/employees_list'

describe Employees do

  it "will return list of added employees" do
		example_employees = Employees.new
		example_employees.add_new_employee('John Doe')
    expect(EmployeesList.list).to include('John Doe')
	end

	it "returns both employees" do
	  example = Employees.new
		example.add_new_employee('John Doe')
		example.add_new_employee('Jane Doe')
		expect(EmployeesList.list).to include('John Doe', 'Jane Doe')
	end

	it "will tell you which are admins" do
		example = Employees.new
		allow(example).to receive (:double_check) {"Y"}
    allow(example).to receive (:admin?) {'y'}
		example.push_admin('Herbert Doe')
		example.add_new_employee('Herbert Doe')
    expect(EmployeesList.admin_list).to include('Herbert Doe') 
	end

	it "will include admins in overall list" do
    expect((EmployeesList.list & EmployeesList.admin_list).empty?).to eq(false) 
	end

end

