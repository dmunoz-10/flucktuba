# frozen_string_literal: true

FactoryBot.define do
  factory :profile do
    user { nil }
    color_theme { 'light' }
  end
end
