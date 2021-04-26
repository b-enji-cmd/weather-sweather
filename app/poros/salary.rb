class Salary
	attr_reader :forecast,	:destination, :salaries
	def initialize(args)
		@forecast = args[:forecast]
		@destination = args[:destination]
		@salaries = args[:salaries]
	end
end
