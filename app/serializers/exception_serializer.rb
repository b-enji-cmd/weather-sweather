class ExceptionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :starting, :ending, :travel_time, :weather_at_eta
end
