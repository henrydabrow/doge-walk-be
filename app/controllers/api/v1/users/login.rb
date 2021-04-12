# frozen_string_literal: true

module API
  module V1
    module Users
      class Login < Base
        params do
          requires :email,    type: String
          requires :password, type: String
        end

        desc "Loggs in a user"

        post :login do
          user = User.find_by!(email: params["email"])

          if user && user.authenticate(params["password"])
            token = generate_token(user_id: user.id)

            ok({
              message: "You are logged in!",
              token: token
            })
          else
            unauthorized
          end
        end
      end
    end
  end
end
