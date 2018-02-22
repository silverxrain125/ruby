class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :attends, :users_id, :user_id
    rename_column :attends, :events_id, :event_id
  end
end
