require "application_system_test_case"

class Category1sTest < ApplicationSystemTestCase
  setup do
    @category1 = category1s(:one)
  end

  test "visiting the index" do
    visit category1s_url
    assert_selector "h1", text: "Category1s"
  end

  test "creating a Category1" do
    visit category1s_url
    click_on "New Category1"

    fill_in "Name", with: @category1.name
    click_on "Create Category1"

    assert_text "Category1 was successfully created"
    click_on "Back"
  end

  test "updating a Category1" do
    visit category1s_url
    click_on "Edit", match: :first

    fill_in "Name", with: @category1.name
    click_on "Update Category1"

    assert_text "Category1 was successfully updated"
    click_on "Back"
  end

  test "destroying a Category1" do
    visit category1s_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Category1 was successfully destroyed"
  end
end
