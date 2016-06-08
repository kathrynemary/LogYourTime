#The files for test/example data are located in the spec/spec_data_files folder.
#Each filename starts with "example" followed by the name of the class being tested,
#then the file's normal name. 
#Lines are commented out so that they will not persist the same data each time the test is run.

require 'spec_helper'

describe EmployeesList do

  it "will return list of added employees" do
    EmployeesList.set_up_list("spec/spec_data_files/example_employees_list_employees_list.yml")
    #    EmployeesList.add_name("John Doe")
    #		EmployeesList.add_name("Eugene O'Reilley")

    output = capture_standardout do
      EmployeesList.return_list
    end

    expect(output).to include('John Doe', "Eugene O'Reilley")
  end

  it "will tell you which are admins" do
    EmployeesList.set_up_admin_list("spec/spec_data_files/example_employees_list_admin_employees_list.yml")
    #   EmployeesList.add_admin_name("Henrietta Doe")

    output = capture_standardout do
      EmployeesList.return_admin_list
    end

    expect(output).to include('Henrietta Doe') 
  end

end

