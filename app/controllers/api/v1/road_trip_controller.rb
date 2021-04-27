class Api::V1::RoadTripController < ApplicationController
    def create
    	valid_user = User.find_by!(api_key: params[:api_key])
    	if valid_user
            transient_trip = MapFacade.get_trip_length(road_trip_params)
            transient_eta_weather = WeatherFacade.get_eta_weather(road_trip_params[:destination],transient_trip)
            json_response(RoadTripSerializer.new(RoadTripFacade.get_trip(road_trip_params, transient_trip, transient_eta_weather)))
    	else
            
    	end
    end

    private

    def road_trip_params
        params.require(:road_trip).permit(:origin, :destination)
    end
end