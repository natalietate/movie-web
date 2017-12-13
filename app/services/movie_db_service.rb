class MovieDbService
   def initialize
     Tmdb::Api.key(ENV['TMDB_API_KEY'])
  end

  def popular
     Tmdb::Movie.popular
   end

   def playing
     Tmdb::Movie.now_playing
   end

 end
