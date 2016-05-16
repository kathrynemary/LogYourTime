require_relative 'errors'

class TimeInputInterface

  attr_reader :time, :date, :date_and_time

	def get_time
	  time_input = ask_time
		verify_time_input(time_input)
	  @time = time_input
	end

  def ask_time
	  puts "What time?"
		gets.chomp
	end

  def get_date
    date_input = ask_date
		verify_date_input(date_input)
		@date = date_input 
	end

	def ask_date
	  puts "What date?"
		gets.chomp
	end

  def get_time_and_date
    time = get_time
		date = get_date
  	@date_and_time = (date + " " +  time) 
  end

	def verify_time_input(input)
    if input =~ /\d+:\d\d+/
			input
		else
			raise Errors::ArgumentError.new("#{input} is an invalid time.")
      get_time
		end
	end
	
	def verify_date_input(input)
    if DateTime.parse(input) <= Date.today 
			input
		else
			raise Errors::ArgumentError.new("#{input} is an invalid date.")
		  get_date
		end
	end

end
