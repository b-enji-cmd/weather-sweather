require "rails_helper"

RSpec.describe 'City API', type: :request do


	describe 'GET /api/v1/salaries?destination=chicago' do
		before {get "/api/v1/salaries?destination=chicago" }
      it "returns the forecast for a city" do
      	expect(json[:data][:type]).to eq 'salaries'
      end
	end
end
