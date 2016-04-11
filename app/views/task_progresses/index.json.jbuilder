json.array!(@task_progresses) do |task_progress|
  json.extract! task_progress, :id, :task_id, :user_id, :done
  json.url task_progress_url(task_progress, format: :json)
end
