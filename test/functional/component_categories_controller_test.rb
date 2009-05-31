require 'test_helper'

class ComponentCategoriesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:component_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create component_category" do
    assert_difference('ComponentCategory.count') do
      post :create, :component_category => { }
    end

    assert_redirected_to component_category_path(assigns(:component_category))
  end

  test "should get edit" do
    get :edit, :id => component_categories(:one).to_param
    assert_response :success
  end

  test "should update component_category" do
    put :update, :id => component_categories(:one).to_param, :component_category => { }
    assert_redirected_to component_categories_path
  end

  test "should destroy component_category" do
    assert_difference('ComponentCategory.count', -1) do
      delete :destroy, :id => component_categories(:one).to_param
    end

    assert_redirected_to component_categories_path
  end
end
