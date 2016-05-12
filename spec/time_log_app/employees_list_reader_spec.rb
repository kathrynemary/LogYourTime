require 'spec_helper'

describe EmployeesListReader do
  
	it "returns the employees" do
		expect(EmployeesListReader.read).to include("John Doe")
	end
	
	it "returns the admins" do
		expect(EmployeesListReader.read_admins).to include("Herbert Doe")
	end

end
