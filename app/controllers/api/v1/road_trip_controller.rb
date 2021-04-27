class Api::V1::RoadTripController < ApplicationController

    def create
    	valid_user = User.find_by!(api_key: road_trip_params[:api_key])
        raise ::BadTripError.new(road_trip_params) if MapFacade.get_trip_length(road_trip_params).nil?
        transient_trip = MapFacade.get_trip_length(road_trip_params)
        transient_location = MapFacade.get_location_details(road_trip_params[:destination])
        transient_eta_weather = WeatherFacade.get_eta_weather(transient_location)
        json_response(RoadTripSerializer.new(RoadTripFacade.get_trip(road_trip_params, transient_trip, transient_eta_weather)))
 
    end

    private

    def road_trip_params
        params.require(:road_trip).permit(:origin, :destination, :api_key)
    end
end