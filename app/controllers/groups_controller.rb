class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def show
    get_group
    @user = current_user
    @members = @group.users
  end

  def new

    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @join_group = @group.user_groups.build(:user_id => current_user.id)
      if @group.save
        redirect_to group_path(@group)
      else
        render 'new', notice: 'Oops!'
      end
  end

  def create_list
    get_group
    get_movie
    @watchlist = @group.group_watchlists.build(params[:id])
    @watchlist.group_id = @group.id
      if @watchlist.save
        redirect_to root_path
      else
        render 'movies/index'
      end
  end

  def join
    @group = Group.find(params[:id])
    @join_group = @group.user_groups.build(:user_id => current_user.id)
      if @join_group.save
        redirect_to(@group, :notice => 'You have joined this group.')
      else
        redirect_to(@group, :notice => 'Join error.')
      end
  end

  private

    def get_user
      @user = User.find_by_id(params[:id])
    end

    def get_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:title, :description)
    end

    def get_movie
      @movie = Movie.new(movie_params)
    end

    def movie_params
      params.permit(:original_title, :poster_path)
    end

end
