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
    director = Director.create!(director_params)
    redirect_to '/directors'
  end

  def edit
    @director = Director.find(params[:id])
  end

  def update
    @director = Director.find(params[:id])
    @director.update!(director_params)
    redirect_to "/directors/#{@director.id}"
  end

  def destroy
    director = Director.find(params[:id])
    director.films.destroy_all
    director.destroy
    redirect_to "/directors"
  end

  private
    def director_params
      params.permit(:name, :birthdate, :hometown, :active, :imdb_rating)
    end
end
