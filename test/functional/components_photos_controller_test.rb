require 'test_helper'

class ComponentsPhotosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:components_photos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create components_photo" do
    assert_difference('ComponentsPhoto.count') do
      post :create, :components_photo => { }
    end

    assert_redirected_to components_photo_path(assigns(:components_photo))
  end

  test "should show components_photo" do
    get :show, :id => components_photos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => components_photos(:one).to_param
    assert_response :success
  end

  test "should update components_photo" do
    put :update, :id => components_photos(:one).to_param, :components_photo => { }
    assert_redirected_to components_photo_path(assigns(:components_photo))
  end

  test "should destroy components_photo" do
    assert_difference('ComponentsPhoto.count', -1) do
      delete :destroy, :id => components_photos(:one).to_param
    end

    assert_redirected_to components_photos_path
  end
end
