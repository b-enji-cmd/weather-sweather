class Api::V1::CitiesController < ApplicationController
    def show
    	transient_salaries = TeleportFacade.get_salaries(params[:destination])
    end
end
