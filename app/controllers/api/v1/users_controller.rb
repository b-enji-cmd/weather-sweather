class Api::V1::UsersController < ApplicationController
    def create
        user = User.create!(user_params)
        user.update(api_key: SecureRandom.hex)
        json_response(UserSerializer.new(user), 201)
    end

    private

    def user_params
        params.permit(:email, :password, :password_confirmation)
    end
end