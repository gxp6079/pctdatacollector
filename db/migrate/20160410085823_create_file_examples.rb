class CreateFileExamples < ActiveRecord::Migration
  def change
    create_table :file_examples do |t|
      t.references :system_example, index: true
      t.string :name
      t.text :code

      t.timestamps
    end
  end
end
