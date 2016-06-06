require_relative 'clients_list'
require 'yaml/store'

class TimeLogReader

  def self.get_employee_events(employee, file="events.yml")
    @employee = employee
		get_file(file)
    filter_by_employee
		update_to_current_month
	end 

  def self.get_file(file)
    unless File.zero?(file)
      @file = YAML.load(File.open(file))
			clone_file
		else
      @updated_file = []
		end
	end

	def self.clone_file
		@updated_file = @file.values.clone
	end

	def self.filter_by_employee
		@updated_file.each do |value|
			value.each do |key2, value2|
				if key2 == "employee"
					if value2 != @employee
						@updated_file.delete(value)
					end
				end
			end
		end

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
				@updated_file.delete(number)
			else
			end
		end
  	@updated_file
	end

	def self.get_event_month(number)
    @event = @updated_file.flatten.fetch(0).values_at("start").to_s
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

	def self.file
		@file
	end

end
