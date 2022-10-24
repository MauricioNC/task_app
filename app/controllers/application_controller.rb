class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user, :verify_entity

  def current_user
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    redirect_to login_path unless logged_in?
  end

  def verify_entity
    @verif_entity = Entity.where(user_id: session[:user_id]).find_by(id: params[:id])
    @verif_entity.nil?
  end
end
