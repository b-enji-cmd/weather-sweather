class Api::V1::WeatherController < ApplicationController
    def index
        transient_forecast = WeatherFacade.get_forecast(params[:location])
        json_response(ForecastSerializer.new(transient_forecast))
    end
end