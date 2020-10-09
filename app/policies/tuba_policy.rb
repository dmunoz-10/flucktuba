# frozen_string_literal: true

# Tuba Policy
class TubaPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    !record.fluck.tuba(user) && !record.fluck.banned?(user)
  end

  def update?
    record.user != user && (record.fluck.owner?(user) || (record.fluck.admin?(user) && !record.owner?))
  end

  def destroy?
    !record.owner? && !record.banned?
  end
end
