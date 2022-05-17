class FilmsController < ApplicationController
  def index
    @films = Film.all.oscar_nod
  end

  def show
    @film = Film.find(params[:id])
  end

  def edit
    @film = Film.find(params[:id])
  end

  def update
    @film = Film.find(params[:id])
    @film.update!(film_params)
    redirect_to "/films/#{@film.id}"
  end

  private
    def film_params
      params.permit(:title, :oscar_nominated, :oscar_wins, :budget, :revenue, :release_date)
    end
end
