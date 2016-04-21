class AddColumnIsInTrainingToUsersTableAndIsForTrainingToSystemExamplesTable < ActiveRecord::Migration
  def change
    add_column :users, :is_in_training, :boolean, :default => false
    add_column :system_examples, :is_for_training, :boolean, :default => false
  end
end
