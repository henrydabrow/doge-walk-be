# frozen_string_literal: true

class UserSerializer < BaseSerializer
  attribute :id, key: :id
  attributes :email,
             :description,
             :first_name,
             :last_name,
             :city,
             :country,
             :postal_code,
             :gender
end
