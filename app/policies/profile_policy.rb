# frozen_string_literal: true

# Profile Policy
class ProfilePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def update?
    true
  end
end
