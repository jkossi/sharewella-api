class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    added_attributes = %i(name phone_number password password_confirmation)
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attributes)
    devise_parameter_sanitizer.permit(:sign_in, keys: added_attributes.excluding(:name))
  end
end
