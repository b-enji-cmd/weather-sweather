require "rails_helper"

RSpec.describe 'City API', type: :request do


	describe 'GET /api/v1/salaries?destination=chicago' do
		before {get "/api/v1/salaries?destination=chicago" }
      it "returns the forecast for a city" do
      	expect(json[:data][:type]).to eq 'salaries'
      	expect(json[:data][:attributes].keys).to eq([:destination, :forecast, :salaries])
      	expect(json[:data][:attributes][:forecast].keys).to eq([:summary,:temperature])
      end

      it "returns salary information" do
      	expect(json[:data][:attributes][:salaries].class).to eq Array
      	expect(json[:data][:attributes][:salaries].first.keys).to eq([:title,:min,:max])
      end

      it "returns the destination" do
      	expect(json[:data][:attributes][:destination]).to eq'chicago'
      end
	end
end
