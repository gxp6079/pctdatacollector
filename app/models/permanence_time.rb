class PermanenceTime < ActiveRecord::Base
  belongs_to :task
  belongs_to :system_example
  belongs_to :file_example
  belongs_to :user
end
