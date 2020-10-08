# frozen_string_literal: true

# Fluck Settings Controller
class FluckSettingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_fluck

  def update
    if @settings.update(fluck_settings_params)
      redirect_to show_flucks_path(@fluck.nickname)
    else
      redirect_to show_flucks_path(@fluck.nickname), alert: 'Customization could not be updated!'
    end
  end

  private

  def fluck_settings_params
    params.require(:fluck_setting).permit(:banner_size, :image_shape,
                                          :primary_color, :text_color)
  end

  def set_fluck
    @fluck = authorize Fluck.find_by!(nickname: params[:id]),
                       :customize?, policy_class: FluckPolicy
    @settings = @fluck.settings
  end
end
