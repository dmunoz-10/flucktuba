# frozen_string_literal: true

# Fluck Model
class Fluck < ApplicationRecord
  has_many :tubas, dependent: :destroy
  has_many :users, through: :tubas

  validates :name, presence: true
end
