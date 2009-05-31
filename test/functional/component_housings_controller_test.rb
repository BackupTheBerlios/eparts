require 'test_helper'

class ComponentHousingsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:component_housings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create component_housing" do
    assert_difference('ComponentHousing.count') do
      post :create, :component_housing => { }
    end

    assert_redirected_to component_housing_path(assigns(:component_housing))
  end

  test "should get edit" do
    get :edit, :id => component_housings(:one).to_param
    assert_response :success
  end

  test "should update component_housing" do
    put :update, :id => component_housings(:one).to_param, :component_housing => { }
    assert_redirected_to component_housings_path
  end

  test "should destroy component_housing" do
    assert_difference('ComponentHousing.count', -1) do
      delete :destroy, :id => component_housings(:one).to_param
    end

    assert_redirected_to component_housings_path
  end
end
