# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.1"

# Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem "rails", "~> 6.0.3", ">= 6.0.3.6"

# Use Active Model has_secure_password
gem "bcrypt"
# Use active_model_serializer for JSON serialization in Grape
gem "grape-active_model_serializers"
# Use grape for API
gem "grape"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.7"
# Use JSONAPI-serializer for JSON serialization in Grape
gem "jsonapi-serializer"
# Use jwt for token management
gem "jwt"
# Use postgresql as the database for Active Record
gem "pg", ">= 0.18", "< 2.0"
# Use Puma as the app server
gem "puma", "~> 4.1"
# Use rack-cors in development
gem "rack-cors"
# Use kaminari for pagination
gem "kaminari"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.2", require: false

group :development, :test do
  # Call "binding.pry" anywhere in the code to stop execution and get a debugger console
  gem "pry-byebug"
  # Use dotenv for env variables
  gem "dotenv-rails"
  # Use factory_bot for writing fixtures
  gem "factory_bot_rails"
  # Use faker to generate better lookin test data
  gem "faker"
end

group :development do
  # Listen is a versatile filesystem event listener, required for other gems
  gem "listen", "~> 3.2"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  # Allow Spring to use the Listen gem
  gem "spring-watcher-listen", "~> 2.0.0"
  # Use rubocop to lint code
  gem "rubocop", require: false
end

group :test do
  # Use RSpec as the testing framework
  gem "rspec-rails"
  # Use shoulda-matchers for testing common Rails functionality
  gem "shoulda-matchers"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
