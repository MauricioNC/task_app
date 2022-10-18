class EntitiesController < ApplicationController
  before_action :authorized
  def index
    @entity = Entity.all
  end

  def new
    @entity = Entity.new
  end
end
