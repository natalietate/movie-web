class GroupWatchlistsController < ApplicationController
  def create
    params[:group][:movie_ids].each do |movie_id|
      GroupWatchlist.find_or_create_by(group_id: params[:id], movie_id: movie_id)
    end
    @group = Group.find(params[:id])
    redirect_to @group
  end

  def destroy
    GroupWatchlist.destroy(params[:id])
    redirect_to root_path
  end

end
