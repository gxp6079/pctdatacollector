class PreTestActivitiesController < ApplicationController

  load_and_authorize_resource

  def take
    if current_user.pre_test_answers.size <= 0
      @pre_test = PreTest.where("pre_tests.group = ?", current_user.group).first
    else
      respond_to do |format|
        format.html { redirect_to :root, notice: 'You have already answered the Pre test.' }
        format.json { head :no_content }
      end
    end
  end

  def finish
    if current_user.pre_test_answers.size <= 0
      current_user.pre_test_answers.create(pre_test_id: params['pre_test_id'], answer: "{\"answer\" : #{params['answer']}}")
      current_user.update_attribute(:is_in_training, false)
      render js: "window.location = '#{task_activities_system_description_url}'"
    end
  end
end
