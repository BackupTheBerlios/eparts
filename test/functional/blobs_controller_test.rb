require 'test_helper'

class BlobsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:blobs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create blob" do
    assert_difference('Blob.count') do
      post :create, :blob => { }
    end

    assert_redirected_to edit_blob_path(assigns(:blob))
  end

  test "should get edit" do
    get :edit, :id => blobs(:one).to_param
    assert_response :success
  end

  test "should update blob" do
    put :update, :id => blobs(:one).to_param, :blob => { }
    assert_redirected_to blobs_path
  end

  test "should destroy blob" do
    assert_difference('Blob.count', -1) do
      delete :destroy, :id => blobs(:one).to_param
    end

    assert_redirected_to blobs_path
  end
end
