# frozen_string_literal: true

# Texts Controller
class TextsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_text, only: %i[update destroy]

  def create
    @text = Text.new(text_params)
    if @text.save
      render :create
    else
      render :error
    end
  end

  def update
    if @text.update(text_params)
      render :update
    else
      render :error
    end
  end

  def destroy
    if @text.destroy
      render :destroy
    else
      render :error
    end
  end

  private

  def text_params
    params.require(:text).permit(:fluck, :title, :description)
  end

  def set_text
    @text = Text.find_by_hashid!(params[:id])
  end
end
