# frozen_string_literal: true

class UserSerializer < BaseSerializer
  attribute :id, key: :id
  attributes :email, :description
end
