class TeleportFacade
	def self.get_salaries(destination)
		salary_data = {
			forecast: WeatherFacade.get_forecast(destination),
			destination: destination,
			salaries: TeleportService.get_salaries(destination)
		}

		transient_salary = Salary.new(salary_data)
	end
end
