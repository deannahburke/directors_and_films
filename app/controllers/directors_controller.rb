class DirectorsController < ApplicationController
  def index
    @directors = Director.all.most_recently_created
  end

  def show
    @director = Director.find(params[:id])
  end
end
