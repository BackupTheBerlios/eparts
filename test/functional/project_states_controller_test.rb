require 'test_helper'

class ProjectStatesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_states)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_state" do
    assert_difference('ProjectState.count') do
      post :create, :project_state => { }
    end

    assert_redirected_to project_state_path(assigns(:project_state))
  end

  test "should get edit" do
    get :edit, :id => project_states(:one).to_param
    assert_response :success
  end

  test "should update project_state" do
    put :update, :id => project_states(:one).to_param, :project_state => { }
    assert_redirected_to project_states_path
  end

  test "should destroy project_state" do
    assert_difference('ProjectState.count', -1) do
      delete :destroy, :id => project_states(:one).to_param
    end

    assert_redirected_to project_states_path
  end
end
