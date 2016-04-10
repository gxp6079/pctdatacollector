class Task < ActiveRecord::Base
  belongs_to :system_example

  validates_presence_of :system_example_id
  validates_presence_of :name
end
