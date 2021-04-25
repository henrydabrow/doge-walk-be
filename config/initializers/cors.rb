# frozen_string_literal: true

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # TO_DO Change it to fe url
    origins '*'
    resource '*',
    headers: :any,
    methods: :any,
    credentials: false
  end

  # TO_DO This is placeholder for production environment
  # allow do
  #   origins "https://jdh-authentication-app-react.herokuapp.com"
  #   resource "*", headers: :any, metohds: %i[get post put patch delete options head],
  #     credentials: true
  # end
end
