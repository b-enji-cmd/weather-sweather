class Api::V1::ImageController < ApplicationController
    def show
        background = ImageFacade.get_background(params[:location])
        json_response(ImageSerializer.new(background))
    end
end