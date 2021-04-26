class Api::V1::SessionsController < ApplicationController
    def create
      user = User.find_by(email: params[:email].downcase)
      if user && user.authenticate(params[:password])
        render json: UserSerializer.new(user), status: 200
      else
        render json: {data: {}, error: 'Bad Credentials'}, status: 400
      end
    end
  end