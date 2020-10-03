# frozen_string_literal: true

# Flucks Controller
class FlucksController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :set_fluck, only: %i[edit show]

  def new
    @fluck = authorize Fluck.new
  end

  def edit; end

  def show; end

  def create
    @fluck = authorize Fluck.new(fluck_params)
    if @fluck.save
      render :show, notice: 'Fluck created!'
    else
      render :edit, alert: 'There was an error!'
    end
  end

  private

  def fluck_params
    params.require(:fluck).permit(:name, :nickname, :description, :image, :banner)
  end

  def set_fluck
    @fluck = Fluck.find_by nickname: params[:id]
  end
end
