class DisplayOptions 
	
	def display_options(employee, type)
  	@type = type
		@employee = employee
		if @type == "admin"
			answer = admin_options
			verify_admin_input(answer)
		else
			answer = non_admin_options
			verify_non_admin_input(answer)
		end
			rescue
				re_try_input
	  SelectAction.new.selection(input)
	  display_options(@employee, @type)
	end

  
	def non_admin_options
    puts "Press 1 to log time, 2 to view this month's hours, or 3 to exit."
	  gets.chomp
	end

  def verify_non_admin_input(input)
		if input =~ /^[123]/
			input
		else
		  invalid_input
		end
	end
  
	def admin_options
    puts "Press 1 to log time, 2 to view your for the month, 3 to exit, 4 to add a new employee, 5 to add a new client, 6 to run the month's totals by employee, or 7 to run the month's totals by client"
	  gets.chomp
	end
  
	def verify_admin_input(input)
		if input =~ /^[1234567]/
			input
		else
			invalid_input
		end
	end
		
  def invalid_input	
		raise Errors::NotAnOptionError.new
  end

	def re_try_input
		puts "That input is not valid! Please try again."
	  display_options(@employee, @type)
	end

end

