require 'yaml'

class TimeLogClientTotals
 
	def self.client_events
    @client_events
	end

	def self.get_client_minutes_worked(client, file="events.yml")
    get_file(file)
		@client = client
		get_client_events(@client, file)
		get_event_minutes
    @sum
	end
	
	def self.get_client_events(client, file)
		get_file(file)
		filter_events_by_client(client)
    get_this_months_client_events
 	end

	def self.get_file(file)
		@file = YAML.load(File.open(file))
	end

	def self.get_this_months_client_events
    get_current_month 
    get_events_for_this_month
	end

	def self.get_current_month 
    @month = Time.now.month
		@year = Time.now.year
	end

	def self.get_event_month(number)
		@event_month = Date.parse(number.to_s).month
    @event_year = Date.parse(number.to_s).year
	end

	def self.filter_events_by_client(client)
		@client_events = @file.clone
		@client_events = @client_events.map do |key|
		  key[1].has_key?("client")
			  key[1].keep_if { key[1].has_value?(client) }  
		end
	end
	
	def self.get_events_for_this_month
		@client_events.map do |number|
	    if number.has_key?("start")
				get_event_month(number.values_at("start"))
				if @event_month != @month || @event_year != @year
					@client_events.delete(number)
				end
			end
		end
	end

  def self.get_event_minutes
		@total_minutes = 0
		@client_events.each do |key|
	    key.each do |key2, value2|		
				if key2 == "minutes_worked"
			  	@total_minutes += value2
		    end
			end
    end
		get_hours_and_minutes
	  @sum = "#{@hours} hours and #{@minutes} minutes worked."
	end

	def self.get_hours_and_minutes
    @minutes = @total_minutes % 60
		@hours = @total_minutes / 60
	end

	def self.total_minutes
		@total_minutes
	end

  def self.sum
		@sum
	end
end

