require "rails_helper"

RSpec.describe 'User Registration API', type: :request do

	describe 'POST /api/v1/users' do
        let!(:body) { {
            email: 'someone@example.com',
            password: 'securepassword',
            password_confirmation: 'securepassword'
        }}

        let!(:invalidbody) { {
            email: 'someone@example.com',
            password: 'securepassword',
            password_confirmation: 'wrongpassword'
        }}

        let!(:bad_email) { {
            email: 'someone@exa_mple.com',
            password: 'doesntmatter'
        }}

        it "successfully creates a user" do
            post api_v1_users_path, headers: headers, params: body, as: :json
            expect(json[:data][:type]).to eq "user"
            expect(json[:data][:attributes].keys).to eq([:id, :email, :api_key])

        end

        it "unsuccessfully creates a user" do
            post api_v1_users_path, headers: headers, params: invalidbody, as: :json
            expect(json[:message]).to eq 'Bad Credentials'
        end

        it "returns 422" do
            post api_v1_users_path, headers: headers, params: bad_email, as: :json
            expect(json[:message]).to eq 'Missing Password Confirmation'
        end
    end
end