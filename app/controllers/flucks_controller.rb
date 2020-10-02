# frozen_string_literal: true

# Flucks Controller
class FlucksController < ApplicationController
  def new
    @fluck = Fluck.new
  end

  private

  def fluck_params
    params.require(:fluck).permit(:name, :nickname, :description, :image, :banner)
  end
end
