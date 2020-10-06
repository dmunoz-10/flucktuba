# frozen_string_literal: true

# Fluck Settings Controller
class FluckSettingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_fluck

  def update
    if @setting.update(fluck_setting_params)
      redirect_to show_flucks_path(@fluck.nickname)
    else
      render :error
    end
  end

  private

  def fluck_setting_params
    params.require(:fluck_setting).permit(:banner_size, :image_shape, :border_image_color,
                                          :primary_color, :text_color)
  end

  def set_fluck
    @fluck = authorize Fluck.find_by!(nickname: params[:id]),
                       :customize?, policy_class: FluckPolicy
    @setting = @fluck.setting
  end
end
