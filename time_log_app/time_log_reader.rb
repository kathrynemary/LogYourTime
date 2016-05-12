require_relative 'clients_list'
require 'yaml/store'

class TimeLogReader
  
	def self.get_file
		file
	end

	def self.file
    @file = YAML.load(File.open("#{@employee}.yml"))
	end

  def self.get_events(employee)
    @employee = employee
		get_file
    update_to_current_month
    print_file
	end

	def self.get_current_month
    @month = Time.now.month
		@year = Time.now.year
	end

	def self.month
    @month
	end

  def self.year
		@year
	end

	def self.update_to_current_month
    get_current_month
		get_number_of_events
		(0..@tally).each do |number|
		  get_event_month(number)
		  if @event_month == @month && @event_year == @year
        @updated_file << @file.keys[number]
				puts @updated_file
			end
		end
	  @updated_file
	end

  def self.get_number_of_events
    @tally = (@file.length - 1)
	end

  def self.tally
		@tally
	end

	def self.get_event_month(number)
    @event = @file[@file.keys[number]]["start"]
		@event_month = Time.parse(@event).month
    @event_year = Time.parse(@event).year
	end

	def self.event_month
		@event_month
	end

	def self.event_year
		@event_year
	end
	
	def self.print_file
		puts @updated_file
		#@updated_file.each_line do |line|
		#	puts line
		#end
	end

end
