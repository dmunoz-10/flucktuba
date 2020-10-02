# frozen_string_literal: true

# Fluck Model
class Fluck < ApplicationRecord
  has_many :tubas, dependent: :destroy
  has_many :users, through: :tubas

  has_one_attached :image
  has_one_attached :banner

  validates :name, presence: true

  NICKNAME_REGEXP = /\A(?!.*\.\.)(?!.*\.$)[^\W][\w.]{0,29}\z/.freeze
  validates :nickname, presence: true, format: { with: NICKNAME_REGEXP }, uniqueness: true
end
