class Api::V1::WeatherController < ApplicationController
    def index
        transient_location = MapFacade.get_location_details(params[:location])
        transient_forecast = WeatherFacade.get_forecast(transient_location)
        json_response(ForecastSerializer.new(transient_forecast))
    end
end