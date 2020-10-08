# frozen_string_literal: true

# Tuba Policy
class TubaPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    record.fluck.owner?(user) || record.fluck.admin?(user)
  end

  def create?
    !record.fluck.tuba(user) && !record.fluck.banned?(user)
  end

  def update?
    record.fluck.owner?(user) || record.fluck.admin?(user)
  end

  def destroy?
    !record.owner? && !record.banned?
  end
end
