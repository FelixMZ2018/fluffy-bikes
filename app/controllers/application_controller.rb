class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    include Pundit

    after_action :verify_authorized, except: :index, unless: :skip_pundit?
    after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  before_action :configure_permitted_parameters, if: :devise_controller?

    CATEGORIES = ["E-Bike","Mountain Bike"]
    DISTRICTS = ["Kreuzberg","Schöneberg"]
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:about,:password,:username,:photo])
  end
  
      private

    def skip_pundit?
      devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
    end
end
