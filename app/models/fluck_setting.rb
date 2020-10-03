class FluckSetting < ApplicationRecord
  belongs_to :fluck

  enum banner_size: { cover: 0, repeat: 1 }

  validate :one_settings_per_fluck
  validates :banner_size, presence: true
  validates :border_image_color, presence: true
  validates :primary_color, presence: true

  private

  def one_settings_per_fluck
    fluck_setting = FluckSetting.find_by(fluck: fluck)
    return unless fluck_setting && fluck_setting != self

    errors.add(:fluck, 'already has a setting')
  end
end
