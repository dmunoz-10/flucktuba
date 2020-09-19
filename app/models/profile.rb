class Profile < ApplicationRecord
  belongs_to :user

  enum color_theme: { light: 0, dark: 1 }

  validates :color_theme, presence: true
end
