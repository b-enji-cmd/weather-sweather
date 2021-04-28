class WeatherFacade
    def self.get_forecast(location)
    		transient_weather = WeatherService.get_weather(location)

			Forecast.new({ 
				current: transient_weather[:current],
				hourly: transient_weather[:hourly][0..7],
				daily: transient_weather[:daily][0..4]
			 })
    end

	def self.get_eta_weather(location)
    	WeatherService.get_weather(location)
	end
end