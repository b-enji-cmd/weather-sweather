class WeatherController < ActionController::API
    def index
        WeatherFacade.get_forecast()
    end
end