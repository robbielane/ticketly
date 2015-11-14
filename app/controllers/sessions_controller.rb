class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_username(params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      if @user.role == 1
        redirect_to admin_dashboard_path
      else
        redirect_to dashboard_path
      end
    else
      flash[:errors] = "Invalid login credentials"
      redirect_to login_path
    end
  end

  def delete
    reset_session
    redirect_to login_path
  end
end
