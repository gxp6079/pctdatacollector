class CreateSystemExamples < ActiveRecord::Migration
  def change
    create_table :system_examples do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
