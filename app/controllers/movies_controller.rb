class MoviesController < ApplicationController
  def index
    @movielist = Movie.all
    get_movie_db
    @movies = movie_provider.popular

  end

  def search
    @movies = movie_provider.find(params[:q])
    render 'movies/index'
    @movie = Movie.new(movie_params)
  end

  def new
    @movie = Movie.new(movie_params)
  end

  def create
    @movie = Movie.new(movie_params)
    @watchlist = @movie.user_watchlists.build(params[:id])
    @watchlist.user_id = current_user.id
      if @watchlist.save
        redirect_to root_path
      else
        render 'movies/index'
      end
  end

  private
  def movie_params
    params.permit(:original_title, :poster_path)
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
