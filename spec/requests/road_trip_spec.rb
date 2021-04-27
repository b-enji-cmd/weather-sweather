require "rails_helper"

RSpec.describe 'Road Trip API', type: :request do

	describe 'POST /api/v1/road_trip' do
        let!(:starting_city) { 'Denver,CO'}
        let!(:destination_city) { 'Pueblo,CO'}
        let!(:sad_destination_city) { 'London,UK'}
        let!(:user_body) { {
            email: 'someone@example.com',
            password: 'securepassword',
            password_confirmation: 'securepassword'
        }}

        it "returns serialized road trip" do
            VCR.use_cassette("road_trip_cassette", :record => :new_episodes) do
                
                post api_v1_users_path, headers: headers, params: user_body, as: :json

                trip_body = {
                    "origin": "#{starting_city}",
                    "destination": "#{destination_city}",
                    "api_key": json[:data][:attributes][:api_key]
                  }

                post api_v1_road_trip_path, headers: headers, params: trip_body, as: :json

                expect(json[:data][:type]).to eq 'road_trip'
                expect(json[:data][:attributes].keys).to eq([:start_city, :end_city, :weather_at_eta, :travel_time])
                expect(json[:data][:attributes][:start_city]).to eq starting_city
                expect(json[:data][:attributes][:end_city]).to eq destination_city
                expect(json[:data][:attributes][:weather_at_eta].keys).to eq([:tempterature, :condition])
                expect( json[:data][:attributes][:weather_at_eta][:tempterature].class).to eq Float
                expect( json[:data][:attributes][:weather_at_eta][:tempterature].class).to eq Float
                expect( json[:data][:attributes][:weather_at_eta][:condition].class).to eq String
                expect( json[:data][:attributes][:travel_time].class).to eq String
            end
        end

        it "returns failed trip creation" do
            VCR.use_cassette("road_trip_cassette_sad_path", :record => :new_episodes) do
                post api_v1_users_path, headers: headers, params: user_body, as: :json
                trip_body = {
                    "origin": "#{starting_city}",
                    "destination": "#{sad_destination_city}",
                    "api_key": json[:data][:attributes][:api_key]
                  }
                  post api_v1_road_trip_path, headers: headers, params: trip_body, as: :json
                  expect(json[:data].keys).to eq([:id, :type, :attributes])
                  expect(json[:data][:type]).to eq("exception")
                  expect(json[:data][:attributes][:starting]).to eq starting_city
                  expect(json[:data][:attributes][:ending]).to eq sad_destination_city
                  expect(json[:data][:attributes][:travel_time]).to eq "Impossible Route"
                  expect(json[:data][:attributes][:weather_at_eta]).to eq({})
            end
        end

        it "returns bad api key" do
            VCR.use_cassette("road_trip_cassette_sad_path_api_key", :record => :new_episodes) do
                post api_v1_users_path, headers: headers, params: user_body, as: :json
                bad_trip_body = {
                    "origin": "#{starting_city}",
                    "destination": "#{sad_destination_city}",
                    "api_key": "12345"
                  }
                  post api_v1_road_trip_path, headers: headers, params: bad_trip_body, as: :json
                  expect(json[:message]).to eq("Couldn't find User")
            end
        end
    end
end