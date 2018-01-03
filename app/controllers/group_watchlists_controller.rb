class GroupWatchlistsController < ApplicationController
  def create
    params[:group][:movie_ids].each do |movie_id|
      GroupWatchlist.find_or_create_by(group_id: params[:id], movie_id: movie_id)
    end
    get_group
    redirect_to @group
  end

  def destroy
    GroupWatchlist.destroy(params[:id])
    redirect_back(fallback_location: root_path)
  end

  def upvote
    get_group
    @movie = params[:movie_id]
    @thegroup = params[:group_id]
    @grouplist = GroupWatchlist.find_by(movie_id: @movie, group_id: @thegroup)
    @grouplist.votes +=1
    @grouplist.save
    redirect_to @group
  end

  private
    def get_group
      @group = Group.find(params[:id])
    end
end
