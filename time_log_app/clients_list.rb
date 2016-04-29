require_relative 'clients'

class ClientsList

  def self.set_up_list
	  @list = []	
	end

	def self.add_name(input)
    unless @list
			set_up_list
		end	
		@list.push(input)
	end
  
	def self.list
		@list
	end

end

