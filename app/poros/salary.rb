class Salary
	attr_reader :forecast,	:destination, :salaries, :id
	def initialize(args)
		@id = nil
		@forecast = set_forecast(args[:forecast])
		@destination = args[:destination]
		@salaries = set_salaries(args[:salaries])
	end

	def set_forecast(forecast)
		{
			summary: forecast.current[:conditions],
			temperature: forecast.current[:temp]
		}
	end


	def set_salaries(salaries)
		salary_dictionary = ["Data Analyst", "Data Scientist", "Mobile Developer", "QA Engineer", "Software Engineer", "Systems Administrator", "Web Developer"]
		salaries.select { |position| salary_dictionary.include?position[:job][:title]}.map do |salary|
			{
				title: salary[:job][:title],
				min: sprintf("$%2.2f", salary[:salary_percentiles][:percentile_25]),
				max: sprintf("$%2.2f", salary[:salary_percentiles][:percentile_75])
			}
		end
	end
end
