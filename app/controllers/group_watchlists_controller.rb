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
    @grouplist.update(:votes)
      if @grouplist.save
        redirect_to root_path
      else
        redirect_to root_path
      end
    end


  def upvote
    # need to find the entry on the group_watchlist table by the group_watchlist ID
    @grouplist = GroupWatchlist.find_by(movie_id: 2, group_id: 1)
    # update the votes column on that entry on the table by 1
    @grouplist.votes +=1
    # save
    @grouplist.save
    redirect_to root_path
  end

  # def upvote
  #   # need to find the entry on the group_watchlist table by the group_watchlist ID
  #   get_group
  #   @movie = Movie.find_by(params[:id])
  #   @grouplist = GroupWatchlist.find_by(movie_id: @movie, group_id: @group)
  #   # update the votes column on that entry on the table by 1
  #   @grouplist.votes +=1
  #   # save
  #   @grouplist.save
  #   redirect_to root_path
  # end

  def get_group
    @group = Group.find(params[:id])
  end

end
