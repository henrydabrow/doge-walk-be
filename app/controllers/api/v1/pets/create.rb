# frozen_string_literal: true

module API
  module V1
    module Pets
      class Create < Base
        params do
          requires :name,        type: String
          requires :kind,        type: String
          optional :breed,       type: String
          optional :birthdate,   type: Integer
          optional :description, type: String
        end

        desc "Creates new pet"

        post do
          pet = Pet.create!(
            name: params["name"],
            kind: params["kind"],
            breed: params["breed"],
            birthdate: parsed_date,
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
