# frozen_string_literal: true

# Images Controller
class ImagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_image

  def create
    @image = Image.new(image_params)
    if @image.save
      render :create
    else
      render :error
    end
  end

  def update
    if @image.update(image_params)
      render :update
    else
      render :error
    end
  end

  def destroy
    if @image.destroy
      render :destroy
    else
      render :error
    end
  end

  private

  def image_params
    params.require(:image).permit(:fluck, :title, images: [])
  end

  def set_image
    @image = Image.find_by_hashid!(params[:id])
  end
end
