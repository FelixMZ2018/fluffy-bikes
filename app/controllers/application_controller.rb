class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:edit_user_registration_path) do |user_params|
    user_params.permit(:photo, :username, :about)
    end
  end
end
