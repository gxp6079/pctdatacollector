class CreatePreTests < ActiveRecord::Migration
  def change
    create_table :pre_tests do |t|
      t.text :description, :default => ""
      t.text :html_test, :default => ""
      t.string :correct_answer, :default => "{}"
      t.string :group, :default => "n/a"

      t.timestamps
    end
  end
end
