class DirectorFilmsController < ApplicationController
  def index
   @director = Director.find(params[:director_id])
    if params[:sort] == "alphabetical"
      @films = @director.films.alphabetize
    elsif params[:oscar_wins]
      @films = @director.films.wins_over_threshold(params[:oscar_wins])
    else
      @films = @director.films
    end
  end

  def new
    @director = Director.find(params[:director_id])
  end

  def create
    @director = Director.find(params[:director_id])
    film = @director.films.create!(film_params)
    redirect_to "/directors/#{@director.id}/films"
  end

  private
    def film_params
      params.permit(:title, :oscar_nominated, :oscar_wins, :budget, :revenue, :release_date)
    end
end
