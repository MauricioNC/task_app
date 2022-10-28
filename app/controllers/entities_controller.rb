class EntitiesController < ApplicationController
  before_action :authorized, :init

  def init
    @global_entities = Entity.where(user_id: session[:user_id]).where(status: "Active")
    @entity = Entity.where(user_id: session[:user_id]).where(status: "Active")
    @entity_locked = Entity.where(user_id: session[:user_id]).where(status: "Locked")
  end
  
  def index
    @first = Entity.order(created_at: :desc).where(user_id: session[:user_id]).where(status: "Active").first()
    
    if !@first.nil?
      @task_by_status = {
        "not_started" => Task.where(entity_id: @first.id, status: "Not started"),
        "in_progress" => Task.where(entity_id: @first.id,status: "In progress"),
        "done" => Task.where(entity_id: @first.id, status: "Done")
      }
    end
  end

  def new
    @entity = Entity.new
  end

  def create
    @entity = Entity.new(entities_params)
    if @entity.save
      flash[:notice] = "Entity created successfully"
      redirect_to root_path
    else
      flash[:error] = "It was not possible to create new entity"
      redirect_to root_path
    end
  end

  def show
    @single_entity = Entity.where(user_id: session[:user_id]).find(params[:id])

    if @single_entity.user_id == session[:user_id]
      @task_by_status = {
        "not_started" => Task.where(entity_id: params[:id], status: "Not started"),
        "in_progress" => Task.where(entity_id: params[:id],status: "In progress"),
        "done" => Task.where(entity_id: params[:id], status: "Done")
      }
    else
      flash[:notice] = "Error, entity consulted does not exist"
      redirect_to root_path
    end
  end

  def edit
    @single_entity = Entity.where(user_id: session[:user_id]).find(params[:id])
  end

  def update
    @single_entity = Entity.where(user_id: session[:user_id]).find(params[:id])
    
    params[:name].nil? == false ? @single_entity.status = "Locked" : @single_entity.update(entities_params)

    if @single_entity.save
      flash[:notice] = "Entity updated successfully"
      redirect_to root_path
    else
      flash[:error] = "Error updating entity"
      redirect_to root_path
    end
  end

  def destroy
    @single_entity = Entity.where(user_id: session[:user_id]).destroy(params[:id])
    redirect_to root_path
  end

  private

  def entities_params
    params.require(:entity).permit(:name, :status, :user_id)
  end
end
