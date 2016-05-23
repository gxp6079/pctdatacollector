class PreTest < ActiveRecord::Base
   validates_presence_of :description, :html_test, :correct_answer, :group
end
