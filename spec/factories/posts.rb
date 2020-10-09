# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    user { nil }
    fluck { nil }
    type { Post.types.keys.sample }
    title { FFaker::Book.title }
    description { FFaker::Book.description }
  end
end
