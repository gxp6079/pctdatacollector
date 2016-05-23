require 'test_helper'

class PreTestsControllerTest < ActionController::TestCase
  setup do
    @pre_test = pre_tests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pre_tests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pre_test" do
    assert_difference('PreTest.count') do
      post :create, pre_test: { correct_answer: @pre_test.correct_answer, description: @pre_test.description, group: @pre_test.group, html_test: @pre_test.html_test }
    end

    assert_redirected_to pre_test_path(assigns(:pre_test))
  end

  test "should show pre_test" do
    get :show, id: @pre_test
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pre_test
    assert_response :success
  end

  test "should update pre_test" do
    patch :update, id: @pre_test, pre_test: { correct_answer: @pre_test.correct_answer, description: @pre_test.description, group: @pre_test.group, html_test: @pre_test.html_test }
    assert_redirected_to pre_test_path(assigns(:pre_test))
  end

  test "should destroy pre_test" do
    assert_difference('PreTest.count', -1) do
      delete :destroy, id: @pre_test
    end

    assert_redirected_to pre_tests_path
  end
end
