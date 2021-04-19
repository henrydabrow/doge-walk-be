# frozen_string_literal: true

RSpec.describe API::V1::Users::Me, type: :request do
  describe "GET /users/me" do
    let!(:user) { create(:user) }

    let(:payload)     { { user_id: user.id, exp: exp } }
    let(:private_key) { OpenSSL::PKey::RSA.new(ENV["JWT_PRIVATE_KEY"]) }
    let(:jwt_token)   { JWT.encode(payload, private_key, "RS256") }

    let(:headers) { { "Authorization" => "Bearer:#{jwt_token}" } }

    context "when JWT is correct (validity will expire in 2 hours)" do
      subject(:request) { get "/api/v1/users/me", headers: headers }

      let(:exp)             { (Time.now + 2.hours).to_i }
      let(:parsed_response) { JSON.parse(response.body).fetch("data").symbolize_keys }
      let(:expected_response) do
        {
          id: user.id,
          email: user.email,
          description: user.description,
          first_name: user.first_name,
          last_name: user.last_name,
          city: user.city,
          country: user.country,
          postal_code: user.postal_code,
          gender: user.gender,
        }
      end

      it "returns serialized users" do
        request

        expect(parsed_response).to match(expected_response)
      end

      it "returns status 200" do
        request

        expect(response).to have_http_status(200)
      end
    end

    context "when JWT expired (validity expired 2 hours ago)" do
      subject(:request) { get "/api/v1/users/me", headers: headers }

      let(:exp) { (Time.now - 2.hours).to_i }

      it "returns status 401" do
        request

        expect(response).to have_http_status(401)
      end

      it "return response 'Expired token'" do
        request

        parsed_response = JSON.parse(response.body).fetch("errors").first

        expected_response = "Expired token"

        expect(parsed_response).to match(expected_response)
      end
    end

    context "when JWT is invalid" do
      subject(:request) { get "/api/v1/users/me", headers: headers }

      let(:exp)               { nil }
      let(:jwt_token)         { "invalid_jwt_token" }
      let(:parsed_response)   { JSON.parse(response.body).fetch("errors").first }
      let(:expected_response) { "Unauthorized" }

      it "return response body 'Unauthorized'" do
        request

        expect(parsed_response).to match(expected_response)
      end

      it "returns status 401" do
        request

        expect(response).to have_http_status(401)
      end
    end
  end
end
