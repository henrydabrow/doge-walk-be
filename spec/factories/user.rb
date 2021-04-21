# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name  { Faker::Name.first_name }
    last_name   { Faker::Name.last_name }
    email       { Faker::Internet.email }
    password    { "Password1!" }
    description { Faker::Lorem.paragraph }
    city        { Faker::Address.city }
    country     { Faker::Address.country }
    postal_code { Faker::Address.postcode }
    gender      { Faker::Gender.type }
  end
end
