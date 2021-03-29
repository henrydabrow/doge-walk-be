# frozen_string_literal: true

module API
  module V1
    module Registration
      class Create < Base
        params do
          requires :email,                 type: String
          requires :password,              type: String
          requires :passwordConfirmation, type: String
        end

        desc "Creates new user"

        post do
          user = User.create!(
            email: params["email"],
            password: params["password"],
            password_confirmation: params["passwordConfirmation"]
          )

          created
        end
      end
    end
  end
end
