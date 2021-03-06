# frozen_string_literal: true

module API
  class Base < Grape::API
    format :json

    mount API::V1::Base
  end
end
