require_relative 'errors'

class WorkTypeInterface

	attr_reader :timecode

  def get_timecode
		input = ask_timecode
		verify_timecode_input(input)
		select_timecode(input)
	end
	
  def verify_timecode_input(input)
    if
			input =~ /^[123]/
		  input
		else
			wrong_timecode_input
		end
	end

	def wrong_timecode_input
	  	raise Errors::StandardError.new
		rescue
			puts "That is not an option! Please try again."
      get_timecode
	end

	def ask_timecode
	  puts "Which type of work was this? Select (1) for billable, (2) for non-billable, or (3) for paid time off."
		gets.chomp
	end

  def select_timecode(input)
	  if input == '1'
			@timecode = 'billable'
		elsif input == '2'
			@timecode = 'non-billable'
		elsif input == '3'
			@timecode = 'paid time off'
		end
	end

end
