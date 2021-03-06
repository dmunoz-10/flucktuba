# frozen_string_literal: true

# Rules Controller
class RulesController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :set_fluck
  before_action :set_rule, except: :create

  rescue_from ActiveRecord::RecordNotFound, with: :content_not_found

  def create
    @rule = @fluck.rules.new(rule_params)
    @type = 1
    if @rule.save
      @rules = @fluck.rules
      @message = 'Rule created!'
      render :index
    else
      render :error
    end
  end

  def edit; end

  def update
    @type = 2
    if @rule.update(rule_params)
      @rules = @fluck.rules
      @message = 'Rule updated!'
      render :index
    else
      render :error
    end
  end

  def destroy
    @type = 3
    if @rule.destroy
      @rules = @fluck.rules
      @message = 'Rule deleted!'
      render :index
    else
      render :error
    end
  end

  private

  def rule_params
    params.require(:rule).permit(:title, :description)
  end

  def set_rule
    @rule = Rule.find_by_hashid!(params[:id])
  end

  def set_fluck
    @fluck = authorize Fluck.find_by!(nickname: params[:fluck_id]),
                       :edit_rules?, policy_class: FluckPolicy
  end
end
