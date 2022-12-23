class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameter, if: :devise_controller?

  private

  def configure_permitted_parameter
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:name, :email, :password)
    end

    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(:name, :email, :password, :current_password)
    end
  end
end
