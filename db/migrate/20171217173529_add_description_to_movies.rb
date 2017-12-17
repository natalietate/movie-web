class AddDescriptionToMovies < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :overview, :text
  end
end
