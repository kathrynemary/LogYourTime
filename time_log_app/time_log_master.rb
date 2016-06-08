require_relative 'time_log_reader'
require 'yaml/store'

class TimeLog

  def self.set_up(employee, file="events.yml")
    @employee = employee
    @log = YAML::Store.new(file)
  end

  def self.employee
    @employee
  end

  def self.add_new_event(employee)
    set_up(employee)	
    get_start_time
    get_end_time
    calculate_time_worked
    get_work_type
    check_if_needs_client
    write_to_log
  rescue
    puts "We are not able to complete the log."
  end

  def self.get_start_time
    answer = TimeInputInterface.new.get_time_and_date("start")
    set_start_time(answer)
  end

  def self.set_start_time(input)
    @start_time = input
  end

  def self.get_end_time
    answer = TimeInputInterface.new.get_time_and_date("end")
    set_end_time(answer)
  end

  def self.set_end_time(input)
    @end_time = input
  end
  def self.calculate_time_worked
    @minutes_worked = CalculateHours.new(@start_time, @end_time).total_minutes 
    @minutes_worked
  end

  def self.minutes_worked
    @minutes_worked
  end

  def self.get_work_type
    answer = WorkTypeInterface.new.get_timecode
    set_work_type(answer)
  end

  def self.set_work_type(input)
    @work_type = input
  end

  def self.check_if_needs_client
    if @work_type != 'billable'
      set_client("N/A")
    else
      get_client
    end
  end

  def self.get_client
    puts "Which of these clients did you work for?"
    ClientsList.get_list
    answer = gets.chomp
    set_client(answer)
  end

  def self.set_client(input)
    @client = input
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


end
