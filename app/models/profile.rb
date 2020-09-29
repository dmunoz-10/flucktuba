class Profile < ApplicationRecord
  belongs_to :user

  enum color_theme: { light: 0, dark: 1 }

  validate :one_profile_per_user
  validates :color_theme, presence: true

  private

  def one_profile_per_user
    profile = Profile.find_by(user: user)
     if profile && profile != self
       errors.add(:user, 'already has a profile')
     end
  end
end
