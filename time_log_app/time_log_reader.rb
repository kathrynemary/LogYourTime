require_relative 'clients_list'
require 'yaml'

class TimeLogReader

  def self.get_employee_events(employee, file="events.yml")
    @employee = employee
		get_file(file)
    filter_by_employee
	end
  
	def self.get_events(employee, file="events.yml")
    @employee = employee
		get_file(file)
    update_to_current_month
	end

	def self.get_file(file)
    @file = YAML.load(File.open(file)) #filter by employee!
		@updated_file = @file.clone
	end

	def self.filter_by_employee
		@updated_file[:event].each do |number| 
			unless @updated_file[:event][:employee] == @employee
				@updated_file.delete(@updated_file.keys[number])
			end
		end
		@updated_file
	end

	def self.get_current_month
    @month = Time.now.month
		@year = Time.now.year
	end

	def self.update_to_current_month
    get_current_month
		@updated_file.each do |number| 
		  get_event_month(number)
			if @event_month != @month || @event_year != @year
				@updated_file.delete(@updated_file.keys[number])
			end
		end
  	@updated_file
	end

	def self.get_event_month(number)
    @event = @file.values.to_s
		@event_month = Date.parse(@event).month
    @event_year = Date.parse(@event).year
	end

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

end
