class AddColumnTrainingDoneToUsers < ActiveRecord::Migration
  def change
    add_column :users, :training_done, :boolean, :default => false
  end
end
