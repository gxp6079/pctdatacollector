class TaskActivitiesController < ApplicationController
  def take
    @task_activities = "Taking a task..."
    @files = FileExample.all
  end

  def system_description
    tasks_in_progress = current_user.tasks_in_progress

    if tasks_in_progress.size > 0
      @system_randomly_selected = tasks_in_progress.first.system_example
      @task_randomly_selected = tasks_in_progress.first
    else
      @system_randomly_selected = SystemExample.all.sample
      @task_randomly_selected = (Task.where system_example: @system_randomly_selected).sample
    end
  end
end
