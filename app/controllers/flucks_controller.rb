# frozen_string_literal: true

# Flucks Controller
class FlucksController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :set_fluck, except: %i[new create]

  rescue_from ActiveRecord::RecordNotFound, with: :content_not_found

  def new
    @fluck = authorize Fluck.new
  end

  def create
    @fluck = authorize Fluck.new(fluck_params)
    if @fluck.save
      current_user.tubas.create(fluck: @fluck, role: :owner)
      render :show, notice: 'Fluck created!'
    else
      render :edit, alert: 'It could not be created!'
    end
  end

  def show; end

  def edit; end

  def update
    if @fluck.update(fluck_params)
      render :show, notice: 'Fluck updated!'
    else
      render :edit, alert: 'It could not be updated!'
    end
  end

  def destroy
    if @fluck.destroy
      redirect_to root_path, notice: 'Fluck Deleted!'
    else
      render :edit, alert: 'It could not be deleted!'
    end
  end

  private

  def fluck_params
    params.require(:fluck).permit(:name, :nickname, :description, :image, :banner)
  end

  def set_fluck
    @fluck = authorize Fluck.find_by!(nickname: params[:id])
  end
end
