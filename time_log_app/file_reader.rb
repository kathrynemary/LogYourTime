class FileReader

  def self.print_file(filename) 
		(File.open(filename)).each_line do |line|
			puts line
    end		
	end

	def self.read_file(filename)
		(File.open(filename)).each_line do |line|
      line
		end
	end

#def self.get_list
#		@list.transaction do
#			@read_file = @list[:name].each	
#		end
#    @read_file
#	end
  
#	def get_employee_list
#	  @list_length = 0	
#		(File.open("employees_list.yml")).lines do |line|
#			@list_length += 1
#    end		
#		@list_length
#	end

end
