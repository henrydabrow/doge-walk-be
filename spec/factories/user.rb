# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    description { Faker::Lorem.paragraph }
    email       { Faker::Internet.email }
    password    { "Password1!" }
  end
end
