module ExceptionHandler
    extend ActiveSupport::Concern
  
    included do
      rescue_from ActiveRecord::RecordNotFound do |exception|
        json_response({ message: exception.message }, :not_found)
      end
  
      rescue_from ActiveRecord::RecordInvalid do |exception|
        json_response({ message: 'Bad Credentials' }, :unprocessable_entity)
      end

      rescue_from Api::V1::RoadTripController::BadTripError do |exception|
        json_response(ExceptionSerializer.new(exception), :unprocessable_entity)
      end
    end
  end