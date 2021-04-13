# frozen_string_literal: true

module API
  module V1
    module Users
      class Index < Base
        desc "Shows all users"

        get :index do
          user = User.all
        end
      end
    end
  end
end
