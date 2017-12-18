class UsersController < ApplicationController
  def index
    @users = User.all
    @movielist = Movie.all
    @user = current_user
    @groups = Group.all
  end
end
