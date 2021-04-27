require "rails_helper"

RSpec.describe "Weather Facade" do
let!(:location) {"denver,co"}
let!(:bad_location) {"asdasd"}
  it "should return the forecast for a good location" do
    VCR.use_cassette("weather_facade_happy", :record => :new_episodes) do
      location_details = MapFacade.get_location_details(location)
      actual = WeatherFacade.get_forecast(location_details)
      expect(actual.class).to eq Forecast
      expect(actual).to respond_to(:current)
      expect(actual).to respond_to(:hourly)
      expect(actual).to respond_to(:daily)

      expect(actual.current.class).to eq Hash
      expect(actual.current.keys).to eq ([:dt, :sunrise, :sunset, :temp, :feels_like, :humidity, :dew_point, :visibility, :weather, :conditions])
      expect(actual.hourly.class).to eq Array
      expect(actual.hourly.length).to eq 8
      expect(actual.daily.class).to eq Array
      expect(actual.daily.length).to eq 5
    end
  end

  it "should get weather at arrival time" do
    VCR.use_cassette("weather_facade_get_eta_weather", :record => :new_episodes) do
      location_details = MapFacade.get_location_details(location)
      actual = WeatherFacade.get_eta_weather(location_details)
      expect(actual.keys).to eq ([:lat, :lon, :timezone, :timezone_offset, :current, :hourly, :daily])
      expect(actual[:hourly].length).to eq 48
      expect(actual[:daily].length).to eq 8
    end
    
  end

end