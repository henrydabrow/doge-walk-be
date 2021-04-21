# frozen_string_literal: true

FactoryBot.define do
  factory :pet do
    name { Faker::Name.name }
    kind { %i[cat dog].sample }
    owner { create(:user) }
  end
end
