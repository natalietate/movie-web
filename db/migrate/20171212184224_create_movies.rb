class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :original_title
      t.string :poster_path
      t.timestamps
    end
  end
end
