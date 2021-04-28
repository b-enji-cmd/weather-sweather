

require "rails_helper"

RSpec.describe 'Weather Service API' do
  let!(:locations) {{:lat=>39.738453, :lng=>-104.984853}}
	describe 'class methods' do
    it "::get_weather" do
        VCR.turn_off!
        json_body = File.read('spec/fixtures/weather_fixture.json')

        stub_request(:get, "https://api.openweathermap.org/data/2.5/onecall?appid=d08b27659823f17a13e9da97c1809126&exclude=minutely&lat=39.738453&lon=-104.984853").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'User-Agent'=>'Faraday v1.4.1'
          }).
        to_return(status: 200, body: json_body, headers: {})
        response = WeatherService.get_weather(locations)
        expect(response.keys).to eq([:lat, :lon, :timezone, :timezone_offset, :current, :hourly, :daily])
        VCR.turn_on!
    end

  end
end