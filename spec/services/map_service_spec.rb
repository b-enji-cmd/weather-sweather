require "rails_helper"

RSpec.describe 'Map Service API' do
	describe 'class methods' do
    it "::get_lat" do
        VCR.turn_off!
        json_body = File.read('spec/fixtures/map_fixture.json')
        stub_request(:get, "http://www.mapquestapi.com/geocoding/v1/address?key=#{ENV['MAPQUEST_API']}&location=Denver,CO").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'User-Agent'=>'Faraday v1.4.1'
          }).
        to_return(status: 200, body: json_body, headers: {})

          response = MapService.get_lat("Denver,CO")
          expect(response.class).to eq Hash
          expect(response.keys).to eq ([:lat, :lng])
          expect(response[:lat].class).to eq Float
          expect(response[:lng].class).to eq Float
         VCR.turn_on!
    end

    it "::get_length" do
      VCR.turn_off!
      json_body = File.read('spec/fixtures/map_length_fixture.json')
      stub_request(:get, "http://www.mapquestapi.com/directions/v2/route?from=Denver,CO&key=#{ENV['MAPQUEST_API']}&to=Pueblo,CO").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v1.4.1'
           }).
         to_return(status: 200, body: json_body, headers: {})
        response = MapService.get_length({origin: "Denver,CO", destination: "Pueblo,CO"})
       expect(response.class).to eq Integer
       expect(response). to eq 6262
      VCR.turn_on!
    end

  end
end