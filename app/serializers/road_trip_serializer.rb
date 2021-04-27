class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :start_city, :end_city, :weather_at_eta
  # For some reason, to which I never figured out or understood, 
  # this attribute was always an array of the rest of the attributes.
  # Please excuse this mess
  attribute :start_city do |object|
    object.start_city.first
  end
  attribute :travel_time do |object|
    "#{(object.travel_time/60)/60} hours and #{((object.travel_time/60)% 60)} minutes"
  end
end
