# frozen_string_literal: true

# Profiles Controller
class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile

  def update
    if @profile.update(profile_params)
      redirect_to edit_user_registration_path, notice: 'Settings has changed!'
    else
      redirect_to edit_user_registration_path, alert: 'There was an error'
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:color_theme, :primary_color)
  end

  def set_profile
    @profile = authorize current_user.profile
  end
end
