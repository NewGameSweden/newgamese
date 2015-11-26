require 'test_helper'

class SeatmapsControllerTest < ActionController::TestCase
  setup do
    @seatmap = seatmaps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seatmaps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create seatmap" do
    assert_difference('Seatmap.count') do
      post :create, seatmap: { name: @seatmap.name }
    end

    assert_redirected_to seatmap_path(assigns(:seatmap))
  end

  test "should show seatmap" do
    get :show, id: @seatmap
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @seatmap
    assert_response :success
  end

  test "should update seatmap" do
    patch :update, id: @seatmap, seatmap: { name: @seatmap.name }
    assert_redirected_to seatmap_path(assigns(:seatmap))
  end

  test "should destroy seatmap" do
    assert_difference('Seatmap.count', -1) do
      delete :destroy, id: @seatmap
    end

    assert_redirected_to seatmaps_path
  end
end
