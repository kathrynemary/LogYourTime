class EmployeeUsernames
  
	def self.set_up_list(user="employee_usernames.yml")
    YAML::Store.new(user)
		@user_names = user
	end

  def self.set_up_username(name)
    unless @user_names
			set_up_list
		end

		user = ask_user_name
    double_check_user(user)
		verify_user_name(user)
	  EmployeeUsernamesList.set_up_username(name, user)
	end

  def self.ask_user_name
	  puts "What would you like the username to be?"
	  answer = gets.chomp	
		answer
	end

	def self.double_check_user(name)
		puts "You entered '#{name}'. Is this correct? Y/N"
		answer = gets.upcase.chomp
		if answer == "N"
		  puts "Okay, never mind then!"
		  ask_user_name
		end
	end
  
	def self.verify_user_name(name)
		if File.read(@user_names).include? name
			raise Errors::ArgumentError.new("That username is already in our records!")
      get_user_name(name)
	 	else
			name
		end
	end

end

