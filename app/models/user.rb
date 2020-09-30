# frozen_string_literal: true

# User Model
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_one :profile

  before_validation { self.email = email.downcase if email.present? }
  before_validation { self.username = username.downcase if username.present? }
  after_create :create_profile

  USERNAME_REGEXP = /\A(?!.*\.\.)(?!.*\.$)[^\W][\w.]{0,29}\z/.freeze

  validates :username, presence: true, format: { with: USERNAME_REGEXP }, uniqueness: true

  private

  def create_profile
    Profile.create!(user: self)
  end
end
