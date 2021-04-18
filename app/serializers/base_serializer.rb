# frozen_string_literal: true

# # frozen_string_literal: true

class BaseSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  def attachment_url(attachment)
    url_for(object.public_send(attachment)) if object.public_send(attachment).attached?
  end
end
