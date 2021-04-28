

require "rails_helper"

RSpec.describe 'Image Service API' do
	describe 'class methods' do
    it "::get_background" do
        VCR.turn_off!
        json_body = File.read('spec/fixtures/image_fixture.json')
        stub_request(:get, "https://api.pexels.com/v1/search?query=denver%20skyline").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'Authorization'=>"#{ENV['PEXELS_API']}",
         'User-Agent'=>'Faraday v1.4.1'
          }).
        to_return(status: 200, body:json_body, headers: {})
        response = ImageService.get_background("denver")
        expect(response.keys).to eq( [:page, :per_page, :photos, :total_results, :next_page])
        expect( response[:photos].first.keys ).to include(:photographer)
        expect( response[:photos].first.keys ).to include(:url)
        VCR.turn_on!
    end

  end
end