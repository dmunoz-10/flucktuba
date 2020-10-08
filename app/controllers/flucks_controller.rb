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
      flash[:notice] = 'Fluck created!'
      render :show
    else
      flash[:alert] = 'It could not be created!'
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @fluck.update(fluck_params)
      flash[:notice] = 'Fluck updated!'
      render :show
    else
      flash[:alert] = 'It could not be updated!'
      render :edit
    end
  end

  def destroy
    if @fluck.destroy
      flash[:notice] = 'Fluck deleted!'
      redirect_to root_path
    else
      flash[:alert] = 'It could not be deleted!'
      render :show
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
