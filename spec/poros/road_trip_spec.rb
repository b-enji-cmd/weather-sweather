require 'rails_helper'

RSpec.describe RoadTrip do
  before :all do
    weather_data = transient_current.merge({hourly: transient_hourly})
    final_weather = weather_data.merge({daily: transient_daily})
    @trip_data = { 
      start_city: "Denver,CO",
      end_city: "Pueblo,CO",
      travel_time: 6262,
      weather_at_eta: final_weather
     }

     @bad_trip_data = { 
      start_city: "Denver,CO",
      end_city: "Pueblo,CO",
      travel_time: nil,
      weather_at_eta: final_weather
     }
     @actual = RoadTrip.new(@trip_data)
     @sad_actual = RoadTrip.new(@bad_trip_data)
  end

  describe "attributes" do
    it "should exist" do
       expect(@actual.class).to eq RoadTrip
       expect(@actual).to respond_to(:start_city)
       expect(@actual).to respond_to(:end_city)
       expect(@actual).to respond_to(:travel_time)
       expect(@actual).to respond_to(:weather_at_eta)
    end
  end

  describe "instance methods" do
    it "#set_eta_weather" do
      expect(@actual.set_eta_weather(@trip_data[:weather_at_eta]).class).to eq Hash
      expect(@actual.set_eta_weather(@trip_data[:weather_at_eta]).keys).to eq([:tempterature, :condition])
      expect(@actual.set_eta_weather(@trip_data[:weather_at_eta])[:tempterature].class).to eq Float
      expect(@actual.set_eta_weather(@trip_data[:weather_at_eta])[:condition].class).to eq String
    end

    it "#set_eta_weather_sad" do
      expect(@sad_actual.weather_at_eta).to eq "Invalid Parameter"
    end
  end
end
