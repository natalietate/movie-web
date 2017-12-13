class MoviesController < ApplicationController
  def index
    @movielist = Movie.all
    get_movie_db
    @movies = movie_provider.popular

  end
  def search
    @movies = movie_provider.find(params[:q])
    render 'movies/index'
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
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

  def get_movie
    @movieDb = MovieDbService.new
    @image_url = @movieDb.configuration.base_url
  end

  def get_movie_db
    @movieDb = MovieDbService.new
  end

  def movie_provider
    @movie_provider ||= MovieDbService.new
  end

end
