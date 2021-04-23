class WeatherController < ActionController::API
    def index
        binding.pry
        WeatherFacade.get_forecast()
    end
end