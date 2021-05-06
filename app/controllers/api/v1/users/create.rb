# frozen_string_literal: true

module API
  module V1
    module Users
      class Create < Base
        params do
          requires :email,                type: String, allow_blank: false
          requires :password,             type: String, allow_blank: false
          requires :passwordConfirmation, type: String, allow_blank: false
          optional :firstName,            type: String
          optional :lastName,             type: String
          optional :city,                 type: String
          optional :country,              type: String
          optional :postalCode,           type: String
          optional :gender,               type: String
        end

        desc "Creates new user"

        post do
          user = User.create!(
            email: params["email"],
            password: params["password"],
            password_confirmation: params["passwordConfirmation"],
            first_name: params["firstName"],
            last_name: params["lastName"],
            city: params["city"],
            country: params["country"],
            postal_code: params["postalCode"],
            gender: params["gender"]
          )

          if user.valid?
            token = generate_token(user_id: user.id)
            cookies[:jid] = {
              value: "refreshToken",
              http_only: true,
              secure: true,
              expires: Time.now + 36000,
              same_site: :none
            }
          end

          created({
            message: "Your account has been created!",
            token: token,
          })
        end
      end
    end
  end
end
