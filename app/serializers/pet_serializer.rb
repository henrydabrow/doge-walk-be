# frozen_string_literal: true

class PetSerializer < BaseSerializer
  attribute :id, key: :id
  attributes :name,
             :kind,
             :breed,
             :birthdate,
             :description

end
