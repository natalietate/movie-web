class AddVotetoGroupWatchlist < ActiveRecord::Migration[5.1]
  def change
    add_column :group_watchlists, :votes, :integer, :default => 0
  end
end
