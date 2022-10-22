class EntitiesController < ApplicationController
  before_action :authorized
  def index
    @entity = Entity.all
    @task_by_status = {
      "not_started" => Task.where(status: "Not started"),
      "in_progress" => Task.where(status: "In progress"),
      "done" => Task.where(status: "Done")
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

  private

  def entities_params
    params.require(:entity).permit(:name, :status, :user_id)
  end
end
