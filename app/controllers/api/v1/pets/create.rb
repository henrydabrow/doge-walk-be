# frozen_string_literal: true

module API
  module V1
    module Pets
      class Create < Base
        params do
          requires :name,        type: String
          requires :kind,        type: String, values: Pet.kinds.keys # [cat, dog]
          optional :breed,       type: String
          optional :birthdate,   type: Date
          optional :description, type: String
        end

        desc "Creates new pet"

        post do
          pet = Pet.create!(
            name: params["name"],
            kind: params["kind"],
            breed: params["breed"],
            birthdate: params["birthdate"],
            description: params["description"],
            owner: current_user
          )

          created({
            message: "Your #{params['kind']}'s profile has been created!",
            data: pet,
          })
        end
      end
    end
  end
end
