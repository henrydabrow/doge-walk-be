# frozen_string_literal: true

module API
  module V1
    module Auth
      class Refresh < Base
        desc "Refreshes a token"

        post :refresh do
          token = generate_token(user_id: current_user.id)
          cookies[:jid] = set_cookie('/', current_user.id)

          ok({
            message: "You are logged in!",
            token: token,
          })
        end
      end
    end
  end
end
