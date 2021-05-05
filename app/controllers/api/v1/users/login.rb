# frozen_string_literal: true

module API
  module V1
    module Users
      class Login < Base
        params do
          requires :email,    type: String, allow_blank: false
          requires :password, type: String, allow_blank: false
        end

        desc "Loggs in a user"

        post :login do
          user = User.find_by(email: params["email"])

          if user&.authenticate(params["password"])
            token = generate_token(user_id: user.id)
            cookies[:jid] = {
              value: "refreshToken",
              http_only: true,
              secure: true,
              expires: Time.now + 36000,
              same_site: :none
            }

            ok({
              message: "You are logged in!",
              token: token,
            })
          else
            unauthorized "Invalid credentials"
          end
        end
      end
    end
  end
end
