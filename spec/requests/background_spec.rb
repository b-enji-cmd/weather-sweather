require "rails_helper"

RSpec.describe 'Background Image API', type: :request do

	describe 'GET /api/v1/backgrounds?location=denver,co' do
        let!(:location) {"denver,co"}
		before {get "/api/v1/backgrounds?location=#{location}"}

        it "returns serialized image" do
            VCR.use_cassette("background_cassette", :record => :new_episodes) do
                expect(json[:data][:type]).to eq 'image'
                expect(json[:data][:attributes].keys).to eq([:id, :location, :image_url, :credit])
                expect(json[:data][:attributes][:location]).to eq location
                expect(json[:data][:attributes][:credit][:source]).to eq 'https://www.pexels.com' 
            end
        end
    end

    describe 'GET /api/v1/backgrounds?location=sadpath' do
        before {get "/api/v1/backgrounds?sadpath=sadpath"}
        it "defaults to pictures of skylines as a sadpath" do
            VCR.use_cassette("background_sad_path", :record => :new_episodes) do
                expect(json[:data][:attributes][:location]).to be_nil
            end
        end

    end

    describe 'GET /api/v1/backgrounds' do
        before {get "/api/v1/backgrounds"}
        it "defaults to pictures of skylines as an edge case" do
            VCR.use_cassette("background_edge_case", :record => :new_episodes) do
                expect(json[:data][:attributes][:location]).to be_nil
            end
        end

    end
end