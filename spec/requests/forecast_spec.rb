require "rails_helper"

RSpec.describe 'Forecast API', type: :request do

	describe 'GET /api/v1/forecast?location=denver,co' do
		before {get "/api/v1/forecast?location=denver,co"}
        it "returns only needed information" do
            expect(json[:data][:type]).to eq 'forecast'
            expect(json[:data][:id]).to be_nil
            expect(json[:data][:attributes].keys).to eq (%i[id current daily hourly])
            expect(json[:data][:attributes][:current].keys).to eq ([:dt, :sunrise, :sunset, :temp, :feels_like, :humidity, :dew_point, :visibility, :weather, :conditions])
        end
	end

	describe 'GET /api/v1/forecast?location=denver,co' do
		before {get "/api/v1/forecast?location=denver,co" }
        it "does not return what I do not need" do
            expect(json[:data][:attributes][:current].keys).not_to eq ([:dt, :sunrise, :sunset, :temp, :feels_like, :pressure ,  :humidity, :dew_point, :uvi, :clouds, :wind_speed, :wind_deg, :visibility, :weather, :conditions, :rain])
        end
	end
end