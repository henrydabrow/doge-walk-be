# frozen_string_literal: true

RSpec.describe API::V1::Users::Login, type: :request do
  describe "POST /users/login" do
    subject(:request) do
      post "/api/v1/users/login",
           params: params
    end

    let(:params) do
      {
        email: email,
        password: password,
      }
    end

    let!(:user) { create(:user) }

    context "when credentials are correct" do
      let(:email)    { user.email }
      let(:password) { user.password }

      it "returns status 200" do
        request

        expect(response).to have_http_status(200)
      end

      it "return valid token" do
        request

        token = JSON.parse(response.body).fetch("token")
        public_key = OpenSSL::PKey::RSA.new(ENV["JWT_PUBLIC_KEY"])
        decoded_token = JWT.decode(token, public_key, true, algorithm: "RS256").first.symbolize_keys

        expected_response = {
          user_id: user.id,
          exp: Integer,
        }

        expect(decoded_token).to match(expected_response)
      end
    end

    context "when credentials are incorrect" do
      context "and email is incorrect" do
        let(:email)    { "invalid_email" }
        let(:password) { user.password }

        it "returns status 401" do
          request

          expect(response).to have_http_status(401)
        end
      end

      context "and password is incorrect" do
        let(:email)    { user.email }
        let(:password) { "invalid_password" }

        it "returns status 401" do
          request

          expect(response).to have_http_status(401)
        end
      end
    end
  end
end
