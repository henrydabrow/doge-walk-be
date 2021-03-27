Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "http://localhost:3000"
    resource "*", headers: :any, metohds: %i[get post put patch delete options head],
      credentials: true
  end

  # TO_DO This is placeholder for production environment
  allow do
    origins "https://jdh-authentication-app-react.herokuapp.com"
    resource "*", headers: :any, metohds: %i[get post put patch delete options head],
      credentials: true
  end
end