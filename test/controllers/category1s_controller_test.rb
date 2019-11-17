require 'test_helper'

class Category1sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category1 = category1s(:one)
  end

  test "should get index" do
    get category1s_url
    assert_response :success
  end

  test "should get new" do
    get new_category1_url
    assert_response :success
  end

  test "should create category1" do
    assert_difference('Category1.count') do
      post category1s_url, params: { category1: { name: @category1.name } }
    end

    assert_redirected_to category1_url(Category1.last)
  end

  test "should show category1" do
    get category1_url(@category1)
    assert_response :success
  end

  test "should get edit" do
    get edit_category1_url(@category1)
    assert_response :success
  end

  test "should update category1" do
    patch category1_url(@category1), params: { category1: { name: @category1.name } }
    assert_redirected_to category1_url(@category1)
  end

  test "should destroy category1" do
    assert_difference('Category1.count', -1) do
      delete category1_url(@category1)
    end

    assert_redirected_to category1s_url
  end
end
