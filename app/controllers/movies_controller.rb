class MoviesController < ApplicationController
  def index
    get_movie_db
    @movies = movie_provider.popular
  end

  def search
    @movies = movie_provider.find(params[:q])
    render 'movies/index'
    get_movie
  end

  def new
    get_movie
  end

  def create
    get_movie
    @watchlist = @movie.user_watchlists.build(params[:id])
    @watchlist.user_id = current_user.id
      if @watchlist.save
        redirect_to root_path
      else
        render 'movies/index'
      end
  end

  def destroy
      @movie = UserWatchlist.find(params[:id])
      @movie.destroy
      redirect_back(fallback_location: root_path)
  end

  private

  def get_movie
    @movie = Movie.find_or_create_by(movie_params)
  end

  def movie_params
    params.permit(:original_title, :poster_path, :overview)
  end

  def get_movie_db
    @movieDb = MovieDbService.new
  end

  def movie_provider
    @movie_provider ||= MovieDbService.new
  end

end
