require 'test_helper'

class TaskProgressesControllerTest < ActionController::TestCase
  setup do
    @task_progress = task_progresses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:task_progresses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task_progress" do
    assert_difference('TaskProgress.count') do
      post :create, task_progress: { done: @task_progress.done, task_id: @task_progress.task_id, user_id: @task_progress.user_id }
    end

    assert_redirected_to task_progress_path(assigns(:task_progress))
  end

  test "should show task_progress" do
    get :show, id: @task_progress
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @task_progress
    assert_response :success
  end

  test "should update task_progress" do
    patch :update, id: @task_progress, task_progress: { done: @task_progress.done, task_id: @task_progress.task_id, user_id: @task_progress.user_id }
    assert_redirected_to task_progress_path(assigns(:task_progress))
  end

  test "should destroy task_progress" do
    assert_difference('TaskProgress.count', -1) do
      delete :destroy, id: @task_progress
    end

    assert_redirected_to task_progresses_path
  end
end
