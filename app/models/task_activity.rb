class TaskActivity
  attr_reader :system, :task, :files
  def initialize user
    # @system = randomly_select_an_unfinished_system
    # @task = randomly_select_an_unfinished_task_from @system
    # @files = Files.all.where("system_id = ?" @system.id)
  end
  def can_retake_experiment? user
    user.is_in_training?
  end
end
