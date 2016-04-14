class AddColumnIsTimeTrackableToUsersTable < ActiveRecord::Migration
  def change
    add_column :users, :is_time_trackable, :boolean, :default => false
  end
end
