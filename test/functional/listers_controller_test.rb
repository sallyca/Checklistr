require 'test_helper'

class ListersControllerTest < ActionController::TestCase
  setup do
    @lister = listers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:listers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lister" do
    assert_difference('Lister.count') do
      post :create, :lister => @lister.attributes
    end

    assert_redirected_to lister_path(assigns(:lister))
  end

  test "should show lister" do
    get :show, :id => @lister.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @lister.to_param
    assert_response :success
  end

  test "should update lister" do
    put :update, :id => @lister.to_param, :lister => @lister.attributes
    assert_redirected_to lister_path(assigns(:lister))
  end

  test "should destroy lister" do
    assert_difference('Lister.count', -1) do
      delete :destroy, :id => @lister.to_param
    end

    assert_redirected_to listers_path
  end
end
