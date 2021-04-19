# frozen_string_literal: true

class UserLightSerializer < BaseSerializer
  attribute :id, key: :id
  attributes :email
end
