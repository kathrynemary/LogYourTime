class Clients

  def initialize
	  @list = []
	end

  def add_new_client(company_name)
	  @list.push(company_name)
	end

  def list
		@list
	end

end
