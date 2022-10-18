class EntitiesController < ApplicationController
  before_action :authorized
  def index
    @entity = Entity.first
    @task_by_status = {
      "not_started" => Task.find_by(status: "Not started"),
      "in_progress" => Task.find_by(status: "In progress"),
      "done" => Task.find_by(status: "Done")
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
      redirect_to new_entity_path
    end
  end

  private

  def entities_params
    params.require(:entity).permit(:name, :status, :user_id)
  end
end
