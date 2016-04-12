class FileExample < ActiveRecord::Base
  belongs_to :system_example

  validates_presence_of :system_example_id
  validates_presence_of :name

  scope :all_by_user_group, -> (user) { where('name LIKE ?', '%' + user.group + '%') }
end
