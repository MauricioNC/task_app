class SessionsController < ApplicationController
  def new
    redirect_to root_path if session[:user_id]
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else  
      render login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end