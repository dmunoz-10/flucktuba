# frozen_string_literal: true

FactoryBot.define do
  factory :participant do
    user { nil }
    fluck { nil }
    role { :member }
  end
end
