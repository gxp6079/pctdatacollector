json.array!(@system_examples) do |system_example|
  json.extract! system_example, :id, :name, :description, :is_for_training
  json.url system_example_url(system_example, format: :json)
end
