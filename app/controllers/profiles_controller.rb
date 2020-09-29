# frozen_string_literal: true

# Profiles Controller
class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def update
    if current_user.profile.update(profile_params)
      redirect_to edit_user_registration_path, notice: 'Settings has changed!'
    else
      redirect_to edit_user_registration_path, alert: 'There was an error'
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:color_theme)
  end
end
