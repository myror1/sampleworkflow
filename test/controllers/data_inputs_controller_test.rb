require 'test_helper'

class DataInputsControllerTest < ActionController::TestCase
  setup do
    @data_input = data_inputs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:data_inputs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create data_input" do
    assert_difference('DataInput.count') do
      post :create, data_input: { name: @data_input.name }
    end

    assert_redirected_to data_input_path(assigns(:data_input))
  end

  test "should show data_input" do
    get :show, id: @data_input
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @data_input
    assert_response :success
  end

  test "should update data_input" do
    patch :update, id: @data_input, data_input: { name: @data_input.name }
    assert_redirected_to data_input_path(assigns(:data_input))
  end

  test "should destroy data_input" do
    assert_difference('DataInput.count', -1) do
      delete :destroy, id: @data_input
    end

    assert_redirected_to data_inputs_path
  end
end
