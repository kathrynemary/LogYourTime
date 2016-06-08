require_relative 'errors'

class TimeInputInterface

  attr_reader :time, :date, :date_and_time

  def get_time(parameter)
    time_input = ask_time(parameter)
    verify_time_input(time_input)
    @time = time_input
  end

  def ask_time(parameter)
    puts "What time of day did this work #{parameter}? Please use the format __:__, e.g. 08:00."
    gets.chomp
  end

  def get_date(parameter)
    date_input = ask_date(parameter)
    verify_date_input(date_input)
    @date = date_input 
  end

  def ask_date(parameter)
    puts "What date did this work #{parameter}? Please use the format Month Day, Year, e.g. April 1, 2000."
    gets.chomp
  end

  def get_time_and_date(parameter)
    time = get_time(parameter)
    date = get_date(parameter)
    @date_and_time = (date + " " +  time) 
  end

  def verify_time_input(input)
    if input =~ /\d+:\d\d+/
      input
    else
      invalid_time_format
    end
  end

  def invalid_time_format
    raise Errors::StandardError.new
  rescue
    puts "That is not a valid time."
    get_time
  end

  def verify_date_input(input)
    if DateTime.parse(input) <= Date.today 
      input
    else
      invalid_date_format
    end
  end

  def invalid_date_format	
    raise Errors::StandardError.new
  rescue
    puts "That is not a valid date."
    get_date
  end

end
