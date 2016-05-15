require 'yaml'

class TimeLogEmployeeTotals
 
	def self.employee_events
    @employee_events
	end

	def self.get_employee_minutes_worked(employee)
    @employee = employee
		get_employee_events(@employee)
		get_event_minutes
	end
	
	def self.get_client_events(client)
		get_file
		filter_events_by_client(client)
    get_this_months_client_events
 	end

	def self.get_file
    @file = YAML.load(File.open("events.yml"))
	end

	def self.filter_events_by_client(client)
    @client_events = @file.clone
    @client_events.keys.each do |number|
      if @client_events[number]["client"] != client
				@client_events.delete(number)
      end
		end
	end	
	
	def self.get_this_months_client_events
    get_current_month 
    get_events_for_this_month
	end

	def self.get_current_month #this is a duplicate of time_log_reader
    @month = Time.now.month
		@year = Time.now.year
	end

	def self.get_events_for_this_month
    @client_events.keys.each do |number|
	    get_event_month(number)
			if @event_month != @month || @event_year != @year
				@client_events.delete(number)
      end
		end
	end

	def self.get_event_month(number) #also a duplicate of time_log_reader
    @event = @client_events[number]["start"]
		@event_month = Date.parse(@event).month
    @event_year = Date.parse(@event).year
	end

  def self.get_event_minutes
    @total_minutes = 0
		@client_events.keys.each do |number|
			mins = @client_events[number]["minutes_worked"].to_i
			@total_minutes += mins 
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

