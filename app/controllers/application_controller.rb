class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authorize_admin
    redirect_to "/", alert: "Access denied" unless user_signed_in? && current_user.admin?
  end
end
