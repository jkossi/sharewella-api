# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ExceptionHandler

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    added_attributes = [:name, :email, :phone_number, :password, :password_confirmation]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attributes)
    devise_parameter_sanitizer.permit(:sign_in, keys: added_attributes.excluding(:name, :email))
  end
end
