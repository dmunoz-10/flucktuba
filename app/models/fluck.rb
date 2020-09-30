# frozen_string_literal: true

# Fluck Model
class Fluck < ApplicationRecord
  has_many :participants, dependent: :destroy
  has_many :users, through: :participants

  validates :name, presence: true
end
