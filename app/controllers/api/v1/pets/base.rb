# frozen_string_literal: true

module API
  module V1
    module Pets
      class Base < API::V1::Base
        namespace :pets do
          scope do
            before { verify_token! }

            mount Create
            mount Index
          end
        end
      end
    end
  end
end
