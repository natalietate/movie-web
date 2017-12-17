class AddDateToGroups < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :event_date, :date
    add_column :groups, :event_time, :time
  end
end
