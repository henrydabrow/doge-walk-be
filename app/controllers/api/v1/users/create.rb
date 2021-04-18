# frozen_string_literal: true

module API
  module V1
    module Users
      class Create < Base
        params do
          requires :email,                type: String
          requires :password,             type: String
          requires :passwordConfirmation, type: String
        end

        desc "Creates new user"

        post :create do
          user = User.create!(
            email: params["email"],
            password: params["password"],
            password_confirmation: params["passwordConfirmation"]
          )

          token = generate_token(user_id: user.id) if user.valid?

          created({
            message: "Your account has been created!",
            token: token,
          })
        end
      end
    end
  end
end
