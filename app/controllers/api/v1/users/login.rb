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

            ok({
              message: "You are logged in!",
              token: token,
            })
          else
            unauthorized
          end
        end
      end
    end
  end
end
