class AddColumnTaskFileIdsOrderInUsers < ActiveRecord::Migration
  def change
    add_column :users, :task_file_ids_order, :string, :default => "[]"
  end
end
