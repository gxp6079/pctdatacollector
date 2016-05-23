json.array!(@pre_tests) do |pre_test|
  json.extract! pre_test, :id, :description, :html_test, :correct_answer, :group
  json.url pre_test_url(pre_test, format: :json)
end
