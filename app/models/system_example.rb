class SystemExample < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  has_many :file_examples, dependent: :destroy

  validates_presence_of :name
end
