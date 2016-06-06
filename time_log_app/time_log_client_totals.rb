require 'yaml'

class TimeLogClientTotals
 
	def self.client_events
    @client_events
	end

	def self.get_client_minutes_worked(client, file="events.yml")
    get_file(file)
		client_events = get_client_events(client, file)
		get_event_minutes(client_events)
    @sum
	end
	
	def self.get_client_events(client, file)
		get_file(file)
		client_events = filter_events_by_client(client)
    get_this_months_client_events(client_events)
 	end

	def self.get_file(file)
		@file = YAML.load(File.open(file))
	end

	def self.get_this_months_client_events(client_events)
    get_current_month 
    get_events_for_this_month(client_events)
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
		if @file.class == FalseClass
		  raise Errors::NotAnOptionError.new
		else
			@client_events = @file.select do |key, value|
				value['client'] == client
			end
		end
	end
	
	def self.get_events_for_this_month(client_events)
    client_events.select do |number, event|
	    if event.has_key?("start")
				get_event_month(event.values_at("start"))
				@event_month == @month && @event_year == @year
			end
		end
	end

  def self.get_event_minutes(client_events)
		@total_minutes = 0
		client_events.each do |key, value|
	    value.each do |key2, value2|		
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

