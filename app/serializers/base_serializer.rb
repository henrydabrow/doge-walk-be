# frozen_string_literal: true

class BaseSerializer
  include Rails.application.routes.url_helpers
  include JSONAPI::Serializer
end
