class EntitiesController < ApplicationController
  before_action :authorized
  def initialize
    @entity = Entity.all
    @single_entity = nil
  end

  def index
    @entity
    @task_by_status = {
      "not_started" => Task.where(entity_id: 1, status: "Not started"),
      "in_progress" => Task.where(entity_id: 1,status: "In progress"),
      "done" => Task.where(entity_id: 1, status: "Done")
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

  private

  def entities_params
    params.require(:entity).permit(:name, :status, :user_id)
  end
end
