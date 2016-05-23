class CreatePreTestAnswers < ActiveRecord::Migration
  def change
    create_table :pre_test_answers do |t|
      t.integer :pre_test_id
      t.integer :user_id
      t.string :answer

      t.timestamps
    end
  end
end
