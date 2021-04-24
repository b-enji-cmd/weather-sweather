class Api::V1::WeatherController < ApplicationController
    def index
        transient_forecast = WeatherFacade.get_forecast(params[:location])
        render json: ForecastSerializer.new(transient_forecast), status: 200
    end
end