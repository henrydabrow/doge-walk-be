# frozen_string_literal: true

module API
  module V1
    module Auth
      class Base < API::V1::Base
        namespace :auth do
          mount Login

          scope do
            before { verify_refresh_token! }

            mount Refresh
          end
        end
      end
    end
  end
end
