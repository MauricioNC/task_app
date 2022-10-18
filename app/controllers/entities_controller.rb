class EntitiesController < ApplicationController
  before_action :authorized
  def index
    @entity = Entity.first
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