class AdminController < ApplicationController
  before_action :authorize_admin

  def index
    @users=User.all
  end
  def handle_admin
    @user=User.where(:username => params[:username])[0]
    if params[:add]
      @user.admin=true
      flash[:notice] = "Admin tillagd"
    else
      @user.admin=nil
      flash[:notice] = "Admin bortaggen"
    end
    redirect_to "/admin"
    @user.save!
  end
end
