require 'spec_helper'

describe EmployeesList do

  it "will return list of added employees" do
    EmployeesList.set_up_list("example_employees_list.yml")
		#		allow(@example_employees).to receive(:ask_user_name) {"hello"}
#		@example_employees.add_new_employee('John Doe')		
#		allow(@example_employees).to receive(:ask_user_name) {"it's_me"}
#		@example_employees.add_new_employee('Jane Doe') 
	
    expect(EmployeesList.return_list).to include('John Doe', 'Herbert Doe')
	end

	it "will tell you which are admins" do
    EmployeesList.set_up_admin_list("example_admin_employees_list.yml")
#    EmployeesList.add_admin_name("Herbert Doe")
		expect(EmployeesList.return_admin_list).to include('Herbert Doe') 
	end

end

