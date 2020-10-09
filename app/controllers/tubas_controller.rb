# frozen_string_literal: true

# Tubas Controller
class TubasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_fluck
  before_action :set_tuba, only: %i[update destroy]

  def index
    authorize @fluck, :see_tubas?, policy_class: FluckPolicy
    @tubas = @fluck.tubas.includes(:user)
  end

  def create
    @tuba = authorize @fluck.tubas.new(user: current_user)
    if @tuba.save
      redirect_to show_flucks_path(@fluck.nickname), notice: 'Joined the fluck!'
    else
      redirect_to show_flucks_path(@fluck.nickname), alert: 'You could not join'
    end
  end

  def update
    result = Tubas::RoleManager.call(current_user, @tuba, params[:tuba][:role])
    if result.success?
      @tubas = @fluck.tubas.includes(:user)
      render :index
    else
      render :error
    end
  end

  def destroy
    if @tuba.destroy
      redirect_to show_flucks_path(@fluck.nickname), notice: 'Left the fluck!'
    else
      redirect_to show_flucks_path(@fluck.nickname), alert: 'You could not leave the fluck'
    end
  end

  private

  def set_fluck
    @fluck = Fluck.find_by!(nickname: params[:fluck_id])
  end

  def set_tuba
    @tuba = authorize Tuba.find_by_hashid!(params[:id])
  end
end
