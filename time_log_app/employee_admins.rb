class EmployeeAdmins

  def self.set_up_list(admin_list="employee_admin_list.yml")
    YAML::Store.new(admin_list)
    @admin_list = admin_list
  end

  def self.admin?(name)
    unless @admin_list
      set_up_list
    end
    interface(name)
  end

  def self.interface(name)
    puts "Would you like #{name} to be an admin? Y/N"
    answer = gets.upcase.chomp
    if answer == "Y"
      push_admin(name)
    else
      puts "Guess not then!"
    end
  end

  def self.push_admin(name)
    puts "You answered yes."
    EmployeesList.add_admin_name(name)
  end

end


