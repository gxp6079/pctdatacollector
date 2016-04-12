class TaskProgress < ActiveRecord::Base
  belongs_to :task
  belongs_to :user

  scope :finished, -> { where(done: true) }
  scope :in_progress, -> { where(done: false) }

end
