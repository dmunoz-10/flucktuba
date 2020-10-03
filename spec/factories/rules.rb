# frozen_string_literal: true

FactoryBot.define do
  factory :rule do
    fluck { nil }
    title { FFaker::Book.title[0...30] }
    description { FFaker::Book.description[0...300] }
  end
end
