require 'spec_helper'

describe EmployeesList do

  it "will return list of added employees" do
    EmployeesList.set_up_list("spec/spec_data_files/example_employees_list_employees_list.yml")
    EmployeesList.add_name("John Doe")
		EmployeesList.add_name("Eugene O'Reilley")
		expect(EmployeesList.return_list).to include('John Doe', "Eugene O'Reilley")
	end

	it "will tell you which are admins" do
    EmployeesList.set_up_admin_list("spec/spec_data_files/example_employees_list_admin_employees_list.yml")
    EmployeesList.add_admin_name("Henrietta Doe")
		expect(EmployeesList.return_admin_list).to include('Henrietta Doe') 
	end

end

