class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

	def configure_permitted_parameters
	  devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password) }
	  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :social_security_number, :first_name, :surname, :phone_number, :address, :postal_code, :postal_address) }
	  devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password, :social_security_number, :first_name, :surname, :phone_number, :address, :postal_code, :postal_address) }
	end
end
