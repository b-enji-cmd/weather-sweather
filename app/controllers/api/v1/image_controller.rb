class Api::V1::ImageController < ApplicationController
    def show
        background = ImageFacade.get_background(params[:location])
        
        render json: ImageSerializer.new(background), status: 200
    end
end