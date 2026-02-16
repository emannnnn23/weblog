# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  stale_when_importmap_changes

  # Devise: redirect users to posts index after sign-in
  def after_sign_in_path_for(resource)
    posts_path
  end

  # Permit the `name` attribute for Devise
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # Sign up form
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name ])
    # Account edit form
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name ])
  end
end
