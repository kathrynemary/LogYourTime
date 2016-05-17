require_relative 'clients'
require 'yaml/store'

class ClientsList

  def self.set_up_list(list="clients_list.yml")
		@list = YAML::Store.new(list)
	
	end

	def self.add_name(input)
    unless @list
			set_up_list
		end	
		@list.transaction do
      @list[:name] ||= []
			@list[:name] << input
			@list.commit
    end
	end
  
	def self.get_list
    unless @list
			set_up_list
		end	
		
		@list.transaction do
			if @list[:name].empty?
				@read_file = "There are no clients yet."
		  else	
				@read_file = @list[:name].each	
			end
		end
    @read_file
	end

end

