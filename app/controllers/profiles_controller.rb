# frozen_string_literal: true

# Profiles Controller
class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile

  rescue_from ActiveRecord::RecordNotFound, with: :content_not_found

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
    @profile = current_user.profile
    raise ActiveRecord::RecordNotFound if @profile.nil?

    authorize @profile
  end
end
