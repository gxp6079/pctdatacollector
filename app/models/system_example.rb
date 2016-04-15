class SystemExample < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  has_many :file_examples, dependent: :restrict_with_exception

  validates_presence_of :name
end
