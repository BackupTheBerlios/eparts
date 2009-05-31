require 'test_helper'

class OrderStatesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:order_states)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order_state" do
    assert_difference('OrderState.count') do
      post :create, :order_state => { }
    end

    assert_redirected_to order_state_path(assigns(:order_state))
  end

  test "should get edit" do
    get :edit, :id => order_states(:one).to_param
    assert_response :success
  end

  test "should update order_state" do
    put :update, :id => order_states(:one).to_param, :order_state => { }
    assert_redirected_to order_states_path
  end

  test "should destroy order_state" do
    assert_difference('OrderState.count', -1) do
      delete :destroy, :id => order_states(:one).to_param
    end

    assert_redirected_to order_states_path
  end
end
