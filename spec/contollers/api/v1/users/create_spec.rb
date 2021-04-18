# frozen_string_literal: true

RSpec.describe API::V1::Users::Create, type: :request do
  describe "POST /users" do
    subject(:request) do
      post "/api/v1/users",
           params: params
    end

    let(:params) do
      {
        email: email,
        password: password,
        passwordConfirmation: password_confirmation,
      }
    end

    let(:email)                 { Faker::Internet.email }
    let(:password)              { "Password1!" }
    let(:password_confirmation) { "Password1!" }

    context "when passwordConfirmation matches password" do
      let(:token)         { JSON.parse(response.body).fetch("token") }
      let(:public_key)    { OpenSSL::PKey::RSA.new(ENV["JWT_PUBLIC_KEY"]) }
      let(:decoded_token) { JWT.decode(token, public_key, true, algorithm: "RS256").first.symbolize_keys }

      let(:expected_response) do
        {
          user_id: String,
          exp: Integer,
        }
      end

      it "return valid token" do
        request

        expect(decoded_token).to match(expected_response)
      end

      it "returns status 201" do
        request

        expect(response).to have_http_status(201)
      end

      context "and request contains optional fields" do
        let(:params) do
          {
            email: email,
            password: password,
            passwordConfirmation: password_confirmation,
            firstName: Faker::Name.first_name,
            lastName: Faker::Name.last_name,
            city: Faker::Address.city,
            country: Faker::Address.country,
            postalCode: Faker::Address.postcode,
            gender: Faker::Gender.binary_type,
          }
        end

        it "creates new User" do
          expect { request }.to change { User.count}.by(1)
        end
      end
    end

    context "when password_confirmation does not match password" do
      context "and email is incorrect" do
        let(:password_confirmation) { "different password" }

        it "returns status 400" do
          request

          expect(response).to have_http_status(400)
        end
      end
    end
  end
end
