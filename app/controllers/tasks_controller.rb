class TasksController < ApplicationController
  before_action :authorized
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(tasks_params)
    if @task.save 
      flash[:notice] = "New task created successfully"
      redirect_to root_path
    else
      flash[:error] = "An error has been ocurre while creating the new task"
      redirect_to new_task_path
    end
  end

  def destroy
    @task = Task.where(entity_id: params[:id]).delete_all
    redirect_to entity_path(params[:id])
  end

  private

  def tasks_params
    params.require(:task).permit(:name, :status, :endtime, :entity_id)
  end

end