require "test_helper"

class DressTest < ActiveSupport::TestCase
  # test that the dress index is displaying all products
  test "visiting the index" do
    visit dresses_url
    assert_selector "h3", text: "All Our Dresses"
    assert_selector ".dress-card", count: Dress.count
  end

  # test user story: add a new dress listing
  test "lets a signed in user create a new dress" do
    login_as users(:george)
    visit "/dresses/new"
    save_and_open_screenshot

    fill_in "brand", with: "Versace"
    fill_in "color", with: "Ivory"
    fill_in "size", with: 10
    fill_in "style", with: "Column"
    fill_in "description", with: "Flowy and gorgeous unique dress."
    fill_in "price_per_day", with: 9000

    save_and_open_screenshot

    click_on 'Create Dress'
    save_and_open_screenshot

    # Should be redirected to listings with new dress
    assert_equal listings_path, page.current_path
    assert_text "Flowy and gorgeous unique dress."
    save_and_open_screenshot
end
