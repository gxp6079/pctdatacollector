class PreTestAnswer < ActiveRecord::Base
  belongs_to :pre_test
  belongs_to :user

  validates :user, :presence => true
  validates :pre_test, :presence => true
end
