# frozen_string_literal: true

module API
  module V1
    module Helpers
      module Params
        def parsed_date
          params["date"] ? Time.at(params["date"]) : nil
        end
      end
    end
  end
end
