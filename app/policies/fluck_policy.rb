# frozen_string_literal: true

# Fluck Policy
class FluckPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def create?
    true
  end

  def show?
    !record.banned?(user)
  end

  def edit?
    record.owner?(user) || record.admin?(user)
  end

  def update?
    record.owner?(user) || record.admin?(user)
  end

  def destroy?
    record.owner?(user)
  end
end
