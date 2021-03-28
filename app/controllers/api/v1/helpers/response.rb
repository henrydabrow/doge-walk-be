# frozen_string_literal: true

module API
  module V1
    module Helpers
      module Response
        def ok(body = {}, options = {})
          status :ok
          body
        end

        def bad_request(errors = [])
          status :bad_request
          { errors: [errors].flatten }
        end

        def not_found(error = "Record not found")
          status :not_found
          { errors: [error] }
        end

        def unauthorized(error = "Unauthorized")
          status :unauthorized
          { errors: [error] }
        end
      end
    end
  end
end
