# frozen_string_literal: true

module API
  module V1
    module Pets
      class Index < Base
        desc "Shows all pets"

        params do
          optional :page,     type: Integer
          optional :per_page, type: Integer
        end

        get do
          render_paginated Pet
        end
      end
    end
  end
end
