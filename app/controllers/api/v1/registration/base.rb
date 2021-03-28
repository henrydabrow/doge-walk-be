# frozen_string_literal: true

module API
  module V1
    module Registration
      class Base < API::V1::Base
        namespace :registration do
          mount Create
        end
      end
    end
  end
end
