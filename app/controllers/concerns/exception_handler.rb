module ExceptionHandler
    extend ActiveSupport::Concern
  
    included do
      rescue_from ActiveRecord::RecordNotFound do |e|
        json_response({ message: e.message }, :not_found)
      end
  
      rescue_from ActiveRecord::RecordInvalid do |e|
        json_response({ message: 'Bad Credentials' }, :unprocessable_entity)
      end

      rescue_from Api::V1::RoadTripController::BadTripError do |e|
        json_response(ExceptionSerializer.new(e), :unprocessable_entity)
      end
    end
  end