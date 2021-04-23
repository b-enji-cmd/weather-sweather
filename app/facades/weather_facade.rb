class WeatherFacade
    def self.get_forecast(location)
			transient_location = MapService.get_lat(location)
    	WeatherService.get_weather(transient_location)
    end
end