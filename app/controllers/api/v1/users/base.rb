# frozen_string_literal: true

module API
  module V1
    module Users
      class Base < API::V1::Base
        namespace :users do
          mount Create
          mount Login

          scope do
            before { verify_token! }

            mount Index
            mount Me
          end
        end
      end
    end
  end
end
