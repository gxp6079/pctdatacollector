class AddColumnRoleToUsersTable < ActiveRecord::Migration
  def change
    add_column :users, :role, :string, :default => "subject"
  end
end
