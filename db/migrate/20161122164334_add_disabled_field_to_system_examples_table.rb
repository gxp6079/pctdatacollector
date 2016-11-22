class AddDisabledFieldToSystemExamplesTable < ActiveRecord::Migration
  def change
    add_column :system_examples, :disabled, :boolean, :default => false
  end
end
