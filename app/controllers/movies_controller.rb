class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find_by_id(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user_id = current_user.id
      if @movie.save
        redirect_to root_path
      else
        render 'new'
      end
  end

  private
  def movie_params
    params.require(:movie).permit(:title)
  end

end
