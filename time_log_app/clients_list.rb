require_relative 'clients'
require 'PStore'

class ClientsList

  def self.set_up_list
	  @list = PStore.new("clients_list.pstore")
	end

	def self.add_name(input)
    unless @list
			set_up_list
		end	
		@list.transaction do
			@list[:name] << input
			@list.commit
    end
	end
  
	def self.return_list
    read_file = @list.transaction { @list.fetch(:name) }
	  read_file
	end	

end

