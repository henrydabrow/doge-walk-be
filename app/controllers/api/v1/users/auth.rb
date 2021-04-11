# frozen_string_literal: true

module API
  module V1
    module Users
      class Create < Base
        params do
          requires :email,    type: String
          requires :password, type: String
        end

        desc "Loggs in a user"

        post do
          user = User.find_by!(email: params["email"])

          created
        end
      end
    end
  end
end
