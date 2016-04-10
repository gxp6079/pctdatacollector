class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :system_example, index: true
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
