require 'test_helper'

class FileExamplesControllerTest < ActionController::TestCase
  setup do
    @file_example = file_examples(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:file_examples)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create file_example" do
    assert_difference('FileExample.count') do
      post :create, file_example: { code: @file_example.code, name: @file_example.name, system_example_id: @file_example.system_example_id }
    end

    assert_redirected_to file_example_path(assigns(:file_example))
  end

  test "should show file_example" do
    get :show, id: @file_example
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @file_example
    assert_response :success
  end

  test "should update file_example" do
    patch :update, id: @file_example, file_example: { code: @file_example.code, name: @file_example.name, system_example_id: @file_example.system_example_id }
    assert_redirected_to file_example_path(assigns(:file_example))
  end

  test "should destroy file_example" do
    assert_difference('FileExample.count', -1) do
      delete :destroy, id: @file_example
    end

    assert_redirected_to file_examples_path
  end
end
