require_relative 'clients_list'
require 'yaml'

class TimeLogReader

	def self.month
    @month
	end

  def self.year
		@year
	end
	
	def self.event_month
		@event_month
	end

	def self.event_year
		@event_year
	end
	
	def self.print_file
    puts @file
	end

	def self.updated_file
    @updated_file	
	end

  def self.tally
		@tally
	end

	def self.get_file(employee)
    @file = YAML.load(File.open("#{employee}.yml"))
	end

  def self.get_events(employee)
    @employee = employee
		get_file(@employee)
    update_to_current_month
	end

	def self.get_current_month
    @month = Time.now.month
		@year = Time.now.year
	end

	def self.update_to_current_month
    get_current_month
		get_number_of_events
		@updated_file = @file.clone
		(0..@tally).each do |number| #change to @updated_file.each do |number|
		  get_event_month(number)
			if @event_month != @month || @event_year != @year
				@updated_file.delete(@updated_file.keys[number])
			end
		end
  	@updated_file
	end

  def self.get_number_of_events
    @tally = (@file.length - 1)
	end

	def self.get_event_month(number)
    @event = @file[@file.keys[number]]["start"]
		@event_month = Date.parse(@event).month
    @event_year = Date.parse(@event).year
	end

end
