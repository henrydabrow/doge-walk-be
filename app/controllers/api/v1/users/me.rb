# frozen_string_literal: true

module API
  module V1
    module Users
      class Me < Base
        desc "Shows all users"

        get :me do
          render current_user
        end
      end
    end
  end
end
