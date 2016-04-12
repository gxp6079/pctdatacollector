class SystemExample < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  has_many :file_examples, dependent: :destroy
end
