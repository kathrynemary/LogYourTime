require 'yaml'

class TimeLogClientTotals
 
	def self.client_events
    @client_events
	end

	def self.get_client_events(client)
		@client = client
		get_file
		filter_events_by_client(@client)
    puts @client_events
 	end

	def self.get_file
    @file = YAML.load(File.open("events.yml"))
	end

	def self.filter_events_by_client(client)
    @client_events = @file.clone
    @client_events.keys.each do |number|
      if @client_events[number]["client"] != client
			  puts @client_events[number]["client"] #########
				puts "that didn't match" ############
				@client_events.delete(@client_events[number])
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

	def self.update_to_current_month
    get_current_month
		get_number_of_events
		@updated_file = @file.clone
		(0..@tally).each do |number|
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

  def self.employee_totals(employee)
		@employee = employee
		TimeLogReader.get_events(@employee)
	  total_hours	
	  @sum = "#{@hours} hours and #{@minutes} minutes worked."
	end
 
	def self.get_start_time
		TimeLogReader.get_events("Jane Doe")
    @file = TimeLogReader.updated_file
    @start = @file[@file.keys[0]]["start"]
	end

	def self.total_hours
    @total_minutes = 0
		@file.keys.each do |number|
			mins = @file[number]["minutes_worked"].to_i
			@total_minutes += mins 
    end
		get_hours_from_minutes
	end

	def self.get_hours_from_minutes
    @minutes = @total_minutes % 60
		@hours = @total_minutes / 60
	end

end

