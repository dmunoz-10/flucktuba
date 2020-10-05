# frozen_string_literal: true

# Rules Controller
class RulesController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :set_fluck
  before_action :set_rule, except: %i[index create]

  def index
    @rules = @fluck.rules
  end

  def create
    @rule = @fluck.rules.new(rule_params)
    if @rule.save
      render :create
    else
      render :error
    end
  end

  def edit; end

  def update
    if @rule.update(rule_params)
      render :update
    else
      render :error
    end
  end

  def destroy
    if @rule.destroy
      render :destroy
    else
      render :error
    end
  end

  private

  def rule_params
    params.require(:rule).permit(:title, :description)
  end

  def set_rule
    authorize @fluck, :edit_rules?, policy_class: FluckPolicy
    @rule = Rule.find(params[:id])
  end

  def set_fluck
    @fluck = Fluck.find_by(nickname: params[:fluck_id])
  end
end
