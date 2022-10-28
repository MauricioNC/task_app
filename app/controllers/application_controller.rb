class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user, :verify_entity, :init

  private

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

  def init
    @global_entities = Entity.where(user_id: session[:user_id]).where(status: "Active")
    @entity = Entity.where(user_id: session[:user_id]).where(status: "Active")
    @entity_locked = Entity.where(user_id: session[:user_id]).where(status: "Locked")
  end
  
end
