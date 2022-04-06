require "application_system_test_case"

class DressesTest < ApplicationSystemTestCase
require "test_helper"

  # test that the dress index is displaying all products
  test "visiting the dress index" do
    visit "/dresses"
    assert_selector "h3", text: "All Our Dresses"
    assert_selector ".dress-card", count: Dress.count
  end

  # test user story: add a new dress listing
  test "lets a signed in user create a new dress" do
    login_as users(:george)
    visit "/dresses/new"
    # save_and_open_screenshot

    fill_in "Brand", with: "Versace"
    fill_in "Color", with: "Ivory"
    page.select("5", from: "Size")
    page.select("Column", from: "Style")
    fill_in "Description", with: "Flowy and gorgeous unique dress."
    fill_in "Price per day", with: 9000

    click_on 'Create Dress'
    # Should be redirected to listings with new dress
    assert_equal listings_path, page.current_path
    assert_text "Flowy and gorgeous"
    # save_and_open_screenshot
  end
end
