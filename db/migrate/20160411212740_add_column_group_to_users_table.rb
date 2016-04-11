class AddColumnGroupToUsersTable < ActiveRecord::Migration
  def change
    add_column :users, :group, :string, :default => "n/a"
  end
end
