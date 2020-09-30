# frozen_string_literal: true

# Tuba Model
class Tuba < ApplicationRecord
  before_validation :default_role

  belongs_to :user
  belongs_to :fluck

  enum role: { member: 0, admin: 1, owner: 2, banned: 3 }

  validates :role, presence: true

  validates :user, uniqueness: {
    scope: :fluck,
    message: 'is already a tuba of this fluck'
  }

  private

  def default_role
    self.role ||= :member
  end
end
