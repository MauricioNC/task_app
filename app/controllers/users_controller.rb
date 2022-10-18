class UsersController < ApplicationController
  before_action :authorized, only: [:show, :update, :delete]
  def new
    redirect_to root_path if session[:user_id]
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User created successfully"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :username, :password, :password_confirmation)
  end
end
