json.array!(@tasks) do |task|
  json.extract! task, :id, :system_example_id, :name, :description
  json.url task_url(task, format: :json)
end
