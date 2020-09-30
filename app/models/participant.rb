# frozen_string_literal: true

# Participant Model
class Participant < ApplicationRecord
  before_validation :default_role

  belongs_to :user
  belongs_to :fluck

  enum role: { member: 0, admin: 1, owner: 2, banned: 3 }

  validates :role, presence: true

  validates :user, uniqueness: {
    scope: :fluck,
    message: 'is already a participant of this fluck'
  }

  private

  def default_role
    self.role ||= :member
  end
end
