#The files for test/example data are located in the spec/spec_data_files folder.
#Each filename starts with "example" followed by the name of the class being tested,
#then the file's normal name. 
#Lines are commented out so that they will not persist the same data each time the test is run.

require 'spec_helper'

describe Employees do

  before :each do
    EmployeesList.set_up_admin_list("spec/spec_data_files/example_employee_admins_employee_admin_list.yml")
  end

  it "can add an employee to an Admins list" do
    EmployeeAdmins.set_up_list("spec/spec_data_files/example_employee_admins_employee_admin_list.yml")
    #		EmployeeAdmins.push_admin('Herbert Doe')
    output = capture_standardout do
      EmployeesList.return_admin_list
    end

    expect(output).to include('Herbert Doe') 
  end

end

