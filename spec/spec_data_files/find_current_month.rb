class FindCurrentMonth
  
	def self.get_date
	find_month
	return_date
	end
	
	def self.find_month
    @date = "1"
		@month = Time.now.month
		@year = Time.now.year
  end

	def self.return_date
    Time.new(@year, @month, @date).to_date
	end

  def self.month
		@month
	end

	def self.year
		@year
	end

end
