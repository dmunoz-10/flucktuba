# frozen_string_literal: true

# Role Manager
module Tubas
  class RoleManager < ApplicationService
    def initialize(current_user, tuba, role)
      @current_user = current_user
      @tuba = tuba
      @role = role
    end

    def call
      if @tuba.group.admin?(@current_user) && @role == 'owner'
        return OpenStruct.new(success?: false, errors: 'Not authorized')
      end

      @tuba.update(role: @role)
      remove_owner if @role == 'owner'
      OpenStruct.new(success?: true, errors: nil)
    rescue ArgumentError => e
      OpenStruct.new(success?: false, errors: e.message)
    end

    private

    def remove_owner
      @current_user.tubas.find_by(group: @tuba.group).admin!
    end
  end
end
