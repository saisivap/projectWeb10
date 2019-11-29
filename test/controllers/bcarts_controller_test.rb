require 'test_helper'

class BcartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bcart = bcarts(:one)
  end

  test "should get index" do
    get bcarts_url
    assert_response :success
  end

  test "should get new" do
    get new_bcart_url
    assert_response :success
  end

  test "should create bcart" do
    assert_difference('Bcart.count') do
      post bcarts_url, params: { bcart: { item_id: @bcart.item_id, user_id: @bcart.user_id } }
    end

    assert_redirected_to bcart_url(Bcart.last)
  end

  test "should show bcart" do
    get bcart_url(@bcart)
    assert_response :success
  end

  test "should get edit" do
    get edit_bcart_url(@bcart)
    assert_response :success
  end

  test "should update bcart" do
    patch bcart_url(@bcart), params: { bcart: { item_id: @bcart.item_id, user_id: @bcart.user_id } }
    assert_redirected_to bcart_url(@bcart)
  end

  test "should destroy bcart" do
    assert_difference('Bcart.count', -1) do
      delete bcart_url(@bcart)
    end

    assert_redirected_to bcarts_url
  end
end
