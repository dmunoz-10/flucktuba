# frozen_string_literal: true

FactoryBot.define do
  factory :text do
    user { nil }
    fluck { nil }
    title { FFaker::Book.title }
    description { FFaker::Book.description }
  end
end
