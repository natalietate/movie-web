class WelcomeController < ApplicationController
  def index
    @users = User.all
    @movielist = Movie.all
  end
end
