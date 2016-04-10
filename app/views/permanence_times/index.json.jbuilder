json.array!(@permanence_times) do |permanence_time|
  json.extract! permanence_time, :id, :task_id, :system_example_id, :file_example_id, :user_id, :seconds
  json.url permanence_time_url(permanence_time, format: :json)
end
