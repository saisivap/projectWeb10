require "application_system_test_case"

class BcartsTest < ApplicationSystemTestCase
  setup do
    @bcart = bcarts(:one)
  end

  test "visiting the index" do
    visit bcarts_url
    assert_selector "h1", text: "Bcarts"
  end

  test "creating a Bcart" do
    visit bcarts_url
    click_on "New Bcart"

    fill_in "Item", with: @bcart.item_id
    fill_in "User", with: @bcart.user_id
    click_on "Create Bcart"

    assert_text "Bcart was successfully created"
    click_on "Back"
  end

  test "updating a Bcart" do
    visit bcarts_url
    click_on "Edit", match: :first

    fill_in "Item", with: @bcart.item_id
    fill_in "User", with: @bcart.user_id
    click_on "Update Bcart"

    assert_text "Bcart was successfully updated"
    click_on "Back"
  end

  test "destroying a Bcart" do
    visit bcarts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bcart was successfully destroyed"
  end
end
