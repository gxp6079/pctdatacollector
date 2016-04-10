require 'test_helper'

class PermanenceTimesControllerTest < ActionController::TestCase
  setup do
    @permanence_time = permanence_times(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:permanence_times)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create permanence_time" do
    assert_difference('PermanenceTime.count') do
      post :create, permanence_time: { file_example_id: @permanence_time.file_example_id, seconds: @permanence_time.seconds, system_example_id: @permanence_time.system_example_id, task_id: @permanence_time.task_id, user_id: @permanence_time.user_id }
    end

    assert_redirected_to permanence_time_path(assigns(:permanence_time))
  end

  test "should show permanence_time" do
    get :show, id: @permanence_time
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @permanence_time
    assert_response :success
  end

  test "should update permanence_time" do
    patch :update, id: @permanence_time, permanence_time: { file_example_id: @permanence_time.file_example_id, seconds: @permanence_time.seconds, system_example_id: @permanence_time.system_example_id, task_id: @permanence_time.task_id, user_id: @permanence_time.user_id }
    assert_redirected_to permanence_time_path(assigns(:permanence_time))
  end

  test "should destroy permanence_time" do
    assert_difference('PermanenceTime.count', -1) do
      delete :destroy, id: @permanence_time
    end

    assert_redirected_to permanence_times_path
  end
end
