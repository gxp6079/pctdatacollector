class PreTestActivitiesController < ApplicationController
  def take
    @pre_test = PreTest.where("pre_tests.group = ?", current_user.group).first
  end

  def finish
    current_user.pre_test_answers.create(pre_test_id: params['pre_test_id'], answer: "{\"answer\" : #{params['answer']}}")
    current_user.update_attribute(:is_in_training, false)
    render js: "window.location = '#{task_activities_system_description_url}'"
  end
end
