# frozen_string_literal: true

# Videos Controller
class VideosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_video, only: %i[update destroy]

  def create
    @video = Video.new(video_params)
    if @video.save
      render :create
    else
      render :error
    end
  end

  def update
    if @video.update(video_params)
      render :update
    else
      render :error
    end
  end

  def destroy
    if @video.destroy
      render :destroy
    else
      render :error
    end
  end

  private

  def video_params
    params.require(:video).permit(:fluck, :title, :video)
  end

  def set_video
    @video = Video.find_by_hashid!(params[:id])
  end
end
