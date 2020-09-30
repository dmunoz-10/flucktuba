# frozen_string_literal: true

# Fluck Model
class Fluck < ApplicationRecord
  validates :name, presence: true
end
