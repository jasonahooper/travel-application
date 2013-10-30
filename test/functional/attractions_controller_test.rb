require 'test_helper'

class AttractionsControllerTest < ActionController::TestCase
  setup do
    @attraction = attractions(:one)
  end

  test "should get index" do
    get :index, :destination_id => @attraction.destination
    assert_response :success
    assert_not_nil assigns(:attractions)
  end

  test "should get new" do
    get :new, :destination_id => @attraction.destination
    assert_response :success
  end

  test "should create attraction" do
    assert_difference('Attraction.count') do
      post :create, :destination_id => @attraction.destination, attraction: { destination_id: @attraction.destination_id, latitude: @attraction.latitude, longitude: @attraction.longitude, name: @attraction.name }
    end

    assert_redirected_to destination_attraction_path(@attraction.destination, assigns(:attraction))
  end

  test "should show attraction" do
    get :show, :destination_id => @attraction.destination, id: @attraction
    assert_response :success
  end

  test "should get edit" do
    get :edit, :destination_id => @attraction.destination, id: @attraction
    assert_response :success
  end

  test "should update attraction" do
    put :update, :destination_id => @attraction.destination, id: @attraction, attraction: { destination_id: @attraction.destination_id, latitude: @attraction.latitude, longitude: @attraction.longitude, name: @attraction.name }
    assert_redirected_to destination_attraction_path(@attraction.destination, assigns(:attraction))
  end

  test "should destroy attraction" do
    assert_difference('Attraction.count', -1) do
      delete :destroy, :destination_id => @attraction.destination_id, id: @attraction
    end

    assert_redirected_to destination_attractions_path(@attraction.destination_id)
  end
end
