class Api::V1::RoadTripController < ApplicationController
    def create
    	valid_user = User.find_by!(api_key: params[:api_key])
    	binding.pry
    	if valid_user
    	else

    	end
    end
end
