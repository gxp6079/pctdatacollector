class CreatePermanenceTimes < ActiveRecord::Migration
  def change
    create_table :permanence_times do |t|
      t.references :task, index: true
      t.references :system_example, index: true
      t.references :file_example, index: true
      t.references :user, index: true
      t.integer :seconds

      t.timestamps
    end
  end
end
