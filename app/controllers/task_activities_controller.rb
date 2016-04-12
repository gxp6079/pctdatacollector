class TaskActivitiesController < ApplicationController
  def take
    @task_activities = "Taking a task..."
    @files = FileExample.all
  end

  def system_description
    @system_randomly_selected = SystemExample.all.sample
    @task_randomly_selected = (Task.where system_example: @system_randomly_selected).sample
  end
end
