require "rails_helper"

RSpec.describe 'Forecast API', type: :request do

	describe 'GET /api/v1/forecast?location=denver,co' do
        it "returns only needed information" do
            VCR.use_cassette('forecast_cassette', :record => :new_episodes) do
                get "/api/v1/forecast?location=denver,co"
                expect(json[:data][:type]).to eq 'forecast'
                expect(json[:data][:id]).to be_nil
                expect(json[:data][:attributes].keys).to eq (%i[id current daily hourly])
                expect(json[:data][:attributes][:current].keys).to eq ([:dt, :sunrise, :sunset, :temp, :feels_like, :humidity, :dew_point, :visibility, :weather, :conditions])
            end
        end

        it "has correct data types" do
            VCR.use_cassette("forecast_cassette", :record => :new_episodes) do
                get "/api/v1/forecast?location=denver,co"
                expect(json[:data][:attributes][:current][:dt].class).to eq String
                expect(json[:data][:attributes][:current][:sunrise].class).to eq String
                expect(json[:data][:attributes][:current][:sunset].class).to eq String
                expect(json[:data][:attributes][:current][:temp].class).to eq Float
                expect(json[:data][:attributes][:current][:feels_like].class).to eq Float
                expect(json[:data][:attributes][:current][:humidity].class).to eq Integer
                expect(json[:data][:attributes][:current][:dew_point].class).to eq Float
                expect(json[:data][:attributes][:current][:visibility].class).to eq Integer
                expect(json[:data][:attributes][:current][:visibility].class).to eq Integer
                expect(json[:data][:attributes][:current][:weather].class).to eq String
                expect(json[:data][:attributes][:current][:conditions].class).to eq String
            end
        end
	end

	describe 'GET /api/v1/forecast?location=denver,co' do
        it "does not return what I do not need" do
            VCR.use_cassette("sad_path", :record => :new_episodes) do
                get "/api/v1/forecast?location=denver,co"
                expect(json[:data][:attributes][:current].keys).not_to eq ([:dt, :sunrise, :sunset, :temp, :feels_like, :pressure ,  :humidity, :dew_point, :uvi, :clouds, :wind_speed, :wind_deg, :visibility, :weather, :conditions, :rain])
            end
        end
	end 
end