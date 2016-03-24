class AdminController < ApplicationController
  before_action :authorize_admin
  def authorize_admin
    redirect_to "/", alert: "Access denied" unless user_signed_in? && current_user.admin?
  end
end
