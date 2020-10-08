# frozen_string_literal: true

# FluckSetting Model
class FluckSetting < ApplicationRecord
  belongs_to :fluck

  enum banner_size: { cover: 0, repeat: 1 }
  enum image_shape: { circle: 0, square: 1, square_with_rounded_corners: 2 }

  validate :one_settings_per_fluck
  validates :banner_size, presence: true
  validates :image_shape, presence: true
  validates :primary_color, presence: true
  validates :text_color, presence: true
  validates :tuba_name, presence: true, length: { minimum: 3, maximum: 30 }

  private

  def one_settings_per_fluck
    fluck_setting = FluckSetting.find_by(fluck: fluck)
    return unless fluck_setting && fluck_setting != self

    errors.add(:fluck, 'already has a setting')
  end
end
