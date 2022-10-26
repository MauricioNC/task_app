class SearcherController < ApplicationController
  def search
    @search_result = Entity.where(user_id: params[:user_id]).find_by("name LIKE ?", "%#{params[:entity_name]}%")
    if @search_result
      redirect_to entity_path(@search_result.id)
    else
      flash[:error] = "Entity not found"
      redirect_to root_path
    end
  end
end