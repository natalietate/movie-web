class MovieDbService
  attr_reader :configuration

  def initialize
    Tmdb::Api.key(ENV['TMDB_API_KEY'])
   @configuration = Tmdb::Configuration.new

  end

  def popular
   Tmdb::Movie.popular
  end

  def find(keyword)
   Tmdb::Movie.find(keyword) if keyword
  end

end
