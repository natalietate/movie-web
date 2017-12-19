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
    redirect_back(fallback_location: root_path)
  end

  def update
    @grouplist = GroupWatchlist.find(params[:id])
    @grouplist.update(:votes)
      if @grouplist.save
        redirect_to root_path
      else
        redirect_to root_path
      end
    end


  def upvote
    get_group
    @group.movie_id = @group.find(params[:movie_id])
    @group.votes +=1
    @group.save
    redirect_to root_path
  end

  # def group_watchlist_params
  #   params.permit(:movie_id, :group_id, :votes)
  # end

  def get_group
    @group = Group.find(params[:id])
  end

end
