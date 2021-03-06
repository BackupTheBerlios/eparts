require 'test_helper'

class ComponentsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:components)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create component" do
    assert_difference('Component.count') do
      post :create, :component => { }
    end

    assert_redirected_to component_path(assigns(:component))
  end

  test "should get edit" do
    get :edit, :id => components(:one).to_param
    assert_response :success
  end

  test "should update component" do
    put :update, :id => components(:one).to_param, :component => { }
    assert_redirected_to components_path
  end

  test "should destroy component" do
    assert_difference('Component.count', -1) do
      delete :destroy, :id => components(:one).to_param
    end

    assert_redirected_to components_path
  end
end
