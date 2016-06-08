require_relative 'clients'
require 'yaml/store'

class ClientsList

  def self.set_up_list(list="clients_list.yml")
    @file = list
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

    display = YAML.load(File.open(@file))
    if File.zero?(@file)
      raise Errors::NotAnOptionError.new
    else
      display.select do |key, value|
        puts value
      end
    end
    display
  end
end

