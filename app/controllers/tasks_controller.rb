class TasksController < ApplicationController
  before_action :authorized, :init
  def new
    if verify_entity
      flash[:error] = "Error creating new task"
      redirect_to root_path
    else
      @task = Task.new
    end
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

  def edit
    @task = Task.find_by(id: params[:id])
  end
  
  def update
    @task = Task.find(params[:id])

    params[:name].nil? == false ? @task.update(status: params[:status]) : @task.update(tasks_params)
    
    if @task.save
      flash[:notice] = "Task updated successfully"
      redirect_to root_path
    else
      flash[:error] = "Error updating task"
      redirect_to root_path
    end
  end

  def destroy
    @task = Task.where(entity_id: params[:id]).delete_all | Task.delete(params[:id])

    if @task > 0
      flash[:notice] = "Task deleted successfully"
      redirect_to root_path
    else
      flash[:error] = "Error deleting the task"
      redirect_to root_path
    end
  end

  private

  def tasks_params
    params.require(:task).permit(:name, :status, :endtime, :entity_id)
  end

end