# frozen_string_literal: true

module API
  module V1
    module Registration
      class Create < Base
        params do
          requires :code, type: String
        end

        post do
          p "sdafsdfaasd XDXDXDX"
        end
      end
    end
  end
end
