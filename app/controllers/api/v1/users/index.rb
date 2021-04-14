# frozen_string_literal: true

module API
  module V1
    module Users
      class Index < Base
        desc "Shows all users"

        params do
          optional :page,     type: Integer
          optional :per_page, type: Integer
        end

        get do
          render_paginated User
        end
      end
    end
  end
end
