class TaskActivitiesController < ApplicationController
  def take
    @task_activities = "Taking a task..."
    @files = FileExample.all
  end
end
