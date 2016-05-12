class AddHtmlQuestionToTasksTableAndAnswerToTaskProgressesTable < ActiveRecord::Migration
  def change
    add_column :tasks, :html_question, :text, :default => ""
    add_column :task_progresses, :answer, :string, :default => "{}"
  end
end
