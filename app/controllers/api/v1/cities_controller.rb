class Api::V1::CitiesController < ApplicationController
    def show
    	transient_salaries = TeleportFacade.get_salaries(params[:destination])
    	render json: SalariesSerializer.new(transient_salaries), status: 200
    end
end
