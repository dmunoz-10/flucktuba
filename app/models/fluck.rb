# frozen_string_literal: true

# Fluck Model
class Fluck < ApplicationRecord
  has_many :tubas, dependent: :destroy
  has_many :users, through: :tubas
  has_many :rules, dependent: :destroy
  has_one :setting, class_name: 'FluckSetting',foreign_key: 'fluck_id', dependent: :destroy

  has_one_attached :image
  has_one_attached :banner

  validates :name, presence: true

  NICKNAME_REGEXP = /\A(?!.*\.\.)(?!.*\.$)[^\W][\w.]{0,29}\z/.freeze
  validates :nickname, presence: true, format: { with: NICKNAME_REGEXP }, uniqueness: true

  def tuba?(user)
    tubas.find_by(user: user)
  end

  def owner?(user)
    tuba?(user)&.owner?
  end

  def admin?(user)
    tuba?(user)&.admin?
  end

  def banned?(user)
    tuba?(user)&.banned?
  end

  private

  def create_settings
    FluckSetting.create!(fluck: self)
  end
end
