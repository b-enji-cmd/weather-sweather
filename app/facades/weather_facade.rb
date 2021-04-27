class WeatherFacade
    def self.get_forecast(location)
			transient_location = MapService.get_lat(location)
    		transient_weather = WeatherService.get_weather(transient_location)

			Forecast.new({ 
				current: transient_weather[:current],
				hourly: transient_weather[:hourly][0..7],
				daily: transient_weather[:daily][0..4]
			 })
    end

	def self.get_eta_weather(location,offset)
		transient_location = MapService.get_lat(location)
    	transient_weather = WeatherService.get_weather(transient_location)
	end
end