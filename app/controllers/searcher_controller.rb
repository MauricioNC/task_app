class SearcherController < ApplicationController
  def search
    @search_result = Entity.where("name LIKE ?", "%#{params[:entity_name]}%")

    if @search_result.empty?
      flash[:error] = "Entity not found"
      redirect_to root_path
      return
    end

    @search_result.each do |entity|
      if entity.user_id != session[:user_id]
        flash[:error] = "Entity not found"
        redirect_to root_path
        return
      else
        redirect_to entity_path(entity.id)
      end
    end
  end
end
