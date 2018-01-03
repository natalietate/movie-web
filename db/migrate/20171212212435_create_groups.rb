class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :title
      t.text :description
      t.date :event_date
      t.time :event_time
      
      t.timestamps
    end
  end
end
