class Api::V1::SessionsController < ApplicationController
    def create
      user = User.find_by(email: params[:email].downcase)
      json_response(UserSerializer.new(user)) if user && user.authenticate(params[:password])
    end
  end