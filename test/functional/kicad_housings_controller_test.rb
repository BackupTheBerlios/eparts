require 'test_helper'

class KicadHousingsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kicad_housings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kicad_housing" do
    assert_difference('KicadHousing.count') do
      post :create, :kicad_housing => { }
    end

    assert_redirected_to kicad_housing_path(assigns(:kicad_housing))
  end

  test "should get edit" do
    get :edit, :id => kicad_housings(:one).to_param
    assert_response :success
  end

  test "should update kicad_housing" do
    put :update, :id => kicad_housings(:one).to_param, :kicad_housing => { }
    assert_redirected_to kicad_housings_path
  end

  test "should destroy kicad_housing" do
    assert_difference('KicadHousing.count', -1) do
      delete :destroy, :id => kicad_housings(:one).to_param
    end

    assert_redirected_to kicad_housings_path
  end
end
