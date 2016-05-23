require 'test_helper'

class PreTestAnswersControllerTest < ActionController::TestCase
  setup do
    @pre_test_answer = pre_test_answers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pre_test_answers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pre_test_answer" do
    assert_difference('PreTestAnswer.count') do
      post :create, pre_test_answer: { answer: @pre_test_answer.answer, pre_test_id: @pre_test_answer.pre_test_id, user_id: @pre_test_answer.user_id }
    end

    assert_redirected_to pre_test_answer_path(assigns(:pre_test_answer))
  end

  test "should show pre_test_answer" do
    get :show, id: @pre_test_answer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pre_test_answer
    assert_response :success
  end

  test "should update pre_test_answer" do
    patch :update, id: @pre_test_answer, pre_test_answer: { answer: @pre_test_answer.answer, pre_test_id: @pre_test_answer.pre_test_id, user_id: @pre_test_answer.user_id }
    assert_redirected_to pre_test_answer_path(assigns(:pre_test_answer))
  end

  test "should destroy pre_test_answer" do
    assert_difference('PreTestAnswer.count', -1) do
      delete :destroy, id: @pre_test_answer
    end

    assert_redirected_to pre_test_answers_path
  end
end
