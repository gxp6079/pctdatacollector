class PreTest < ActiveRecord::Base
  has_many :pre_test_answers, dependent: :restrict_with_exception

  validates_presence_of :description, :html_test, :correct_answer, :group
end
