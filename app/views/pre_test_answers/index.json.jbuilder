json.array!(@pre_test_answers) do |pre_test_answer|
  json.extract! pre_test_answer, :id, :pre_test_id, :user_id, :answer
  json.url pre_test_answer_url(pre_test_answer, format: :json)
end
