# frozen_string_literal: true

# Application Controller
class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def content_not_found
    render file: "#{Rails.root}/public/404", layout: true, status: :not_found
  end

  private

  def user_not_authorized
    flash[:error] = 'You cannot perform this action'
    redirect_to(request.referer || root_path)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username avatar description])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username avatar description])
  end
end
