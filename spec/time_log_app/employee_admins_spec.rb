require 'spec_helper'

describe Employees do

  before :each do
		EmployeesList.set_up_admin_list("spec/spec_data_files/example_employee_admins_employee_admin_list.yml")
	end

	it "can add an employee to an Admins list" do
		EmployeeAdmins.set_up_list("spec/spec_data_files/example_employee_admins_employee_admin_list.yml")
		EmployeeAdmins.push_admin('Herbert Doe')
    expect(EmployeesList.return_admin_list).to include('Herbert Doe') 
	end

end

