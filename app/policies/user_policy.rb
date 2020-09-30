# frozen_string_literal: true

# User Policy
class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def remove_avatar?
    user.avatar.attached?
  end
end
