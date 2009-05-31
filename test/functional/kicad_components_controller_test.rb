require 'test_helper'

class KicadComponentsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kicad_components)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kicad_component" do
    assert_difference('KicadComponent.count') do
      post :create, :kicad_component => { }
    end

    assert_redirected_to kicad_component_path(assigns(:kicad_component))
  end

  test "should get edit" do
    get :edit, :id => kicad_components(:one).to_param
    assert_response :success
  end

  test "should update kicad_component" do
    put :update, :id => kicad_components(:one).to_param, :kicad_component => { }
    assert_redirected_to kicad_components_path
  end

  test "should destroy kicad_component" do
    assert_difference('KicadComponent.count', -1) do
      delete :destroy, :id => kicad_components(:one).to_param
    end

    assert_redirected_to kicad_components_path
  end
end
