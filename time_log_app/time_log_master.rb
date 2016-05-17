require_relative 'time_log_reader'
require 'yaml/store'

class TimeLog

	def self.set_up(employee, file="events.yml")
		@employee = employee
	  @log = YAML::Store.new(file)
	end
	
  def self.add_new_event(employee)
    set_up(employee)	
		get_start_time
		get_end_time
		calculate_time_worked
		get_work_type
  	check_if_needs_client
		write_to_log
	end
	
	def self.get_start_time
    @start_time = TimeInputInterface.new.get_time_and_date
  end

	def self.get_end_time
		@end_time = TimeInputInterface.new.get_time_and_date
	end

	def self.calculate_time_worked
		@minutes_worked = CalculateHours.new(@start_time, @end_time).total_minutes 
	  @minutes_worked
	end

	def self.get_work_type
	  @work_type = WorkTypeInterface.new.get_timecode
	end

  def self.check_if_needs_client
		if @work_type != 'paid time off'
			@client = "N/A"
		else
			get_client
		end
	end

  def self.get_client
    puts "Which of these clients did you work for?"
		ClientsList.display_list
		@client = gets.chomp
	end

	def self.synthesize_event
    @event = {'employee' => @employee, 'start' => @start_time, 'end' => @end_time, 'minutes_worked' => @minutes_worked, 'work_type' => @work_type, 'client' => @client} 
	end

	def self.write_to_log
		unless @log
      set_up(@employee)
		end

		synthesize_event
		@log.transaction do
	    @log[@employee => @start_time] ||= []
			@log[@employee => @start_time] = @event
			@log.commit
		end
	end

  #def self.get_event
   # if @log
		#	@log.transaction do
		#		@log[:name].each {|key, value| puts key, value} 
		#	end
	  #end	
#		@log.transaction do
#		  puts @log[key]
#		  @log[key]
#		end
#	end

end
