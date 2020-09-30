# frozen_string_literal: true

# Users Controller
class UsersController < ApplicationController
  before_action :authenticate_user!, only: :remove_avatar
  before_action :set_user, only: :show

  def show; end

  def remove_avatar
    authorize current_user
    current_user.avatar.purge_later
    redirect_to edit_user_registration_path, notice: 'Avatar has been removed!'
  end

  private

  def set_user
    @user = authorize User.find_by(username: params[:id])
  end
end
