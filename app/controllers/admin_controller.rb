class AdminController < ApplicationController
  before_action :authorize_admin
  def authorize_admin
    redirect_to "/", alert: "Access denied" unless user_signed_in? && current_user.admin?
  end
  def index
    @users=User.all
  end
  def add_admin
    @user=User.where(:username => params[:username])[0]
    @user.admin=true
    @user.save!
    flash[:notice] = "Ny admin tillagd"
    redirect_to "/admin"
  end
  def remove_admin
    @user=User.where(:username => params[:username])[0]
    @user.admin=nil
    @user.save!
    flash[:notice] = "Admin borttagen"
    redirect_to "/admin"
  end
end
