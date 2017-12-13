class WelcomeController < ApplicationController
  def index
    @users = User.all
    @movielist = Movie.all
    @user = current_user
  end
end
