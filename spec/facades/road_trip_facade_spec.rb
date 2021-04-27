require "rails_helper"

RSpec.describe "Road Trip Facade" do
  let!(:locations) { {origin: "Denver,CO", 
                      destination: "Pueblo,CO"} }

  let!(:bad_locations) { {origin: "Denver,CO", 
                        destination: "London,UK"} }                     
  it "should return a road trip" do
    VCR.use_cassette("road_trip_facade_happy", :record => :new_episodes) do
      trip_length = MapFacade.get_trip_length(locations)
      trip_lat_long = MapFacade.get_location_details(locations[:destination])
      destination_weather = WeatherFacade.get_eta_weather(trip_lat_long)
      actual = RoadTripFacade.get_trip(locations, trip_length, destination_weather )
      expect(actual.class).to eq RoadTrip
      expect(actual).to respond_to(:end_city)
      expect(actual).to respond_to(:start_city)
      expect(actual).to respond_to(:travel_time)
      expect(actual).to respond_to(:weather_at_eta)
    end
  end

  it "should return a bad road trip" do
    VCR.use_cassette("road_trip_facade_sad", :record => :new_episodes) do
      trip_length = MapFacade.get_trip_length(bad_locations)
      trip_lat_long = MapFacade.get_location_details(bad_locations[:destination])
      destination_weather = WeatherFacade.get_eta_weather(trip_lat_long)
      actual = RoadTripFacade.get_trip(locations, trip_length, destination_weather )
      expect(actual.class).to eq RoadTrip
      expect(actual.travel_time).to be_nil
      expect(actual).to respond_to(:start_city)
      expect(actual).to respond_to(:travel_time)
      expect(actual.weather_at_eta).to eq("Invalid Parameter")
    end
  end
end