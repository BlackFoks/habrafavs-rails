require 'test_helper'

class HabrausersControllerTest < ActionController::TestCase
  setup do
    @habrauser = habrausers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:habrausers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create habrauser" do
    assert_difference('Habrauser.count') do
      post :create, habrauser: @habrauser.attributes
    end

    assert_redirected_to habrauser_path(assigns(:habrauser))
  end

  test "should show habrauser" do
    get :show, id: @habrauser.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @habrauser.to_param
    assert_response :success
  end

  test "should update habrauser" do
    put :update, id: @habrauser.to_param, habrauser: @habrauser.attributes
    assert_redirected_to habrauser_path(assigns(:habrauser))
  end

  test "should destroy habrauser" do
    assert_difference('Habrauser.count', -1) do
      delete :destroy, id: @habrauser.to_param
    end

    assert_redirected_to habrausers_path
  end
end
