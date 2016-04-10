json.array!(@file_examples) do |file_example|
  json.extract! file_example, :id, :system_example_id, :name, :code
  json.url file_example_url(file_example, format: :json)
end
