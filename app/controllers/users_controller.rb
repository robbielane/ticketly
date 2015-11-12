class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/dashboard'
    else
      flash[:notice] = "Invalid user credentials. Please try again."
      redirect_to login_path
    end
  end

  def dashboard
    @user = User.find(session[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :name)
  end
end
