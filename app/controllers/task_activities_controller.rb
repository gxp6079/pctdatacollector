class TaskActivitiesController < ApplicationController
  def take
    @task_activities = "Taking a task..."
    @files = FileExample.all
  end

  def system_description
    @experiment_finished = false
    in_progress_tasks = current_user.in_progress_tasks

    if in_progress_tasks.size > 0
      @system_randomly_selected = in_progress_tasks.first.system_example
      @task_randomly_selected = in_progress_tasks.first
    else
      unfinished_system_examples = current_user.unfinished_systems

      if unfinished_system_examples.size > 0
        @system_randomly_selected = unfinished_system_examples.sample
        @task_randomly_selected = current_user.unfinished_tasks(@system_randomly_selected).sample
      else
        # user has finished all tasks
        @experiment_finished = true
      end
    end
  end
end
