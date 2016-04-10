require 'test_helper'

class SystemExamplesControllerTest < ActionController::TestCase
  setup do
    @system_example = system_examples(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:system_examples)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create system_example" do
    assert_difference('SystemExample.count') do
      post :create, system_example: { description: @system_example.description, name: @system_example.name }
    end

    assert_redirected_to system_example_path(assigns(:system_example))
  end

  test "should show system_example" do
    get :show, id: @system_example
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @system_example
    assert_response :success
  end

  test "should update system_example" do
    patch :update, id: @system_example, system_example: { description: @system_example.description, name: @system_example.name }
    assert_redirected_to system_example_path(assigns(:system_example))
  end

  test "should destroy system_example" do
    assert_difference('SystemExample.count', -1) do
      delete :destroy, id: @system_example
    end

    assert_redirected_to system_examples_path
  end
end
