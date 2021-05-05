# frozen_string_literal: true

module API
  module V1
    class Base < API::Base
      version "v1", using: :path
      format :json

      formatter :json, Grape::Formatter::ActiveModelSerializers

      helpers Helpers::Auth
      helpers Helpers::Pagination
      helpers Helpers::Response

      rescue_from Grape::Exceptions::ValidationErrors do |e|
        error!({ errors: e.full_messages }, 400)
      end

      rescue_from ActiveRecord::RecordNotFound do |_|
        error!({ errors: ["Record not found"] }, 404)
      end

      rescue_from ActiveRecord::RecordInvalid do |e|
        error!({ errors: e.record.errors.full_messages }, 400)
      end

      mount Users::Base
      mount Pets::Base
    end
  end
end
