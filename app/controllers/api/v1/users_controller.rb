class Api::V1::UsersController < ApplicationController
    before_action :validate_params, only: [:create]
    def create
        user = User.create!(user_params)
        user.update(api_key: SecureRandom.hex)
        json_response(UserSerializer.new(user), 201)
    end

    def validate_params
        params[:password_confirmation].present? ? create : json_response({ message: 'Missing Password Confirmation' }, :unprocessable_entity)
    end

    private

    def user_params
        params.permit(:email, :password, :password_confirmation)
    end
end