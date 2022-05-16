class DirectorsController < ApplicationController
  def index
    @directors = Director.all.most_recently_created
  end

  def show
    @director = Director.find(params[:id])
  end

  def new
  end

  def create
    director = Director.create!(
      name: params[:name],
      birthdate: params[:birthdate],
      hometown: params[:hometown],
      active: params[:active],
      imdb_rating: params[:rating])

    redirect_to '/directors'
  end

  def edit
    @director = Director.find(params[:id])
  end
end
