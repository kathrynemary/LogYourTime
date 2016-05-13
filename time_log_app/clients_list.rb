require_relative 'clients'
require 'yaml/store'

class ClientsList

  def self.set_up_list
	  @list = YAML.load(File.open("clients_list.yml"))
	end

	def self.add_name(input)
    unless @list
			set_up_list
		end	
		#@list.transaction do
      @list[:name] ||= []
			@list[:name] << input
		#	@list.commit
   # end
	end
  
	def self.get_list
    #@list.transaction do
		  @read_file = @list[:name]	
		#end
	  @read_file
	end

  def self.display_list
		get_list
	  puts @read_file
	end

end

