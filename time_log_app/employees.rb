class Employees
  
  attr_reader :list

	def initialize(list="employees_list.yml")
    YAML::Store.new(list)
		@list = list
	end

	def add_new_employee(name)
	  double_check(name)
		verify_input(name)
    get_user_name(name)
		admin?(name)
		EmployeesList.add_name(name)
	end

  def get_user_name(name)
	  EmployeeUsernames.set_up_username(name)
	end

  def double_check(name)
		puts "You entered '#{name}'. Is this correct? Y/N"
		answer = gets.upcase.chomp
		if answer == "N"
		  puts "Okay, never mind then!"
      get_employee_name
		end
	end
  
	def get_employee_name
		puts "What is the name?"
		input = gets.chomp
	  add_new_employee(input)
	end

  def verify_input(name)
		(File.open(@list)).each_line do |line|
			if line.include?(name)
		    name_already_in_use
			end
		end
	end

	def name_already_in_use
	  	raise Errors::DuplicateNameError.new
	end

  def get_new_name
	  puts "What name would you like to add?"
		answer = gets.chomp
		add_new_employee(answer)
	end

	def admin?(name)
	  EmployeeAdmins.admin?(name)
	end

end

