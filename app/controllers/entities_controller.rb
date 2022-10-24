class EntitiesController < ApplicationController
  before_action :authorized
  def initialize
    @entity = Entity.where(status: "Active")
    @single_entity = nil
    @entity_locked = Entity.where(status: "Locked")
  end

  def index
    @entity
    @first = Entity.first()
    @task_by_status = {
      "not_started" => Task.where(entity_id: @first.id, status: "Not started"),
      "in_progress" => Task.where(entity_id: @first.id,status: "In progress"),
      "done" => Task.where(entity_id: @first.id, status: "Done")
    }
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
    @single_entity = Entity.find(params[:id])
    @task_by_status = {
      "not_started" => Task.where(entity_id: params[:id], status: "Not started"),
      "in_progress" => Task.where(entity_id: params[:id],status: "In progress"),
      "done" => Task.where(entity_id: params[:id], status: "Done")
    }
  end

  def edit
    @single_entity = Entity.find(params[:id])
  end

  def update
    @single_entity = Entity.find(params[:id])
    @single_entity.update(entities_params)

    if @single_entity.save
      flash[:notice] = "Entity updated successfully"
      redirect_to root_path
    else
      flash[:error] = "Error updating entity"
      redirect_to root_path
    end
  end

  def destroy
    @single_entity = Entity.destroy(params[:id])
    redirect_to root_path
  end

  private

  def entities_params
    params.require(:entity).permit(:name, :status, :user_id)
  end
end
