# frozen_string_literal: true

FactoryBot.define do
  factory :fluck do
    name { FFaker::Company.name }
    nickname { FFaker::Internet.user_name }
    description { FFaker::Lorem.paragraph }
  end
end
