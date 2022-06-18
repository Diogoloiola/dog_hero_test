require "test_helper"

class DogWalkingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dog_walking = dog_walkings(:one)
  end

  test "should get index" do
    get dog_walkings_url, as: :json
    assert_response :success
  end

  test "should create dog_walking" do
    assert_difference("DogWalking.count") do
      post dog_walkings_url, params: { dog_walking: { appointment_date: @dog_walking.appointment_date, dogs_attributes: @dog_walking.dogs_attributes, duration: @dog_walking.duration, end_tour: @dog_walking.end_tour, latitude: @dog_walking.latitude, longitude: @dog_walking.longitude, price: @dog_walking.price, start_tour: @dog_walking.start_tour } }, as: :json
    end

    assert_response :created
  end

  test "should show dog_walking" do
    get dog_walking_url(@dog_walking), as: :json
    assert_response :success
  end

  test "should update dog_walking" do
    patch dog_walking_url(@dog_walking), params: { dog_walking: { appointment_date: @dog_walking.appointment_date, dogs_attributes: @dog_walking.dogs_attributes, duration: @dog_walking.duration, end_tour: @dog_walking.end_tour, latitude: @dog_walking.latitude, longitude: @dog_walking.longitude, price: @dog_walking.price, start_tour: @dog_walking.start_tour } }, as: :json
    assert_response :success
  end

  test "should destroy dog_walking" do
    assert_difference("DogWalking.count", -1) do
      delete dog_walking_url(@dog_walking), as: :json
    end

    assert_response :no_content
  end
end
