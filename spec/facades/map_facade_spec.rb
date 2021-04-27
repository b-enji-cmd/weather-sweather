require "rails_helper"

RSpec.describe "Map Facade" do
  let!(:location) {"denver"}
  let!(:locations) { {"origin": "Denver,CO", 
                    "destination": "Pueblo,CO"} }

  it "should return latitude and longitude" do
    VCR.use_cassette("map_facade_details", :record => :new_episodes) do
      expect(MapFacade.get_location_details(location).keys).to eq([:lat, :lng])
      expect(MapFacade.get_location_details(location)[:lat].class).to eq Float
      expect(MapFacade.get_location_details(location)[:lng].class).to eq Float
    end
  end
  it "should return time in seconds between two points" do
    VCR.use_cassette("map_facade_length", :record => :new_episodes) do
      expect(MapFacade.get_trip_length(locations).class).to eq(Integer)
    end
  end
end