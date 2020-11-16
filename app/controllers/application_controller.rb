class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :username, :date_of_birth) }

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :username, :date_of_birth, :avatar) }
  end
end
