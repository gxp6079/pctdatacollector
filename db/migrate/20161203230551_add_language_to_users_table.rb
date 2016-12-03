class AddLanguageToUsersTable < ActiveRecord::Migration
  def change
    add_column :users, :language, :string, :default => 'en'
  end
end
