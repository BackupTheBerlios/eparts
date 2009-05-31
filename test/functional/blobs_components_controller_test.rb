require 'test_helper'

class BlobsComponentsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:blobs_components)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create blobs_component" do
    assert_difference('BlobsComponent.count') do
      post :create, :blobs_component => { }
    end

    assert_redirected_to edit_blobs_component_path(assigns(:blobs_component))
  end

  test "should show blobs_component" do
    get :show, :id => blobs_components(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => blobs_components(:one).to_param
    assert_response :success
  end

  test "should update blobs_component" do
    put :update, :id => blobs_components(:one).to_param, :blobs_component => { }
    assert_redirected_to blobs_component_path(assigns(:blobs_component))
  end

  test "should destroy blobs_component" do
    assert_difference('BlobsComponent.count', -1) do
      delete :destroy, :id => blobs_components(:one).to_param
    end

    assert_redirected_to blobs_components_path
  end
end
