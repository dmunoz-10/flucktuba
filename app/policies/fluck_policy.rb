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
end
