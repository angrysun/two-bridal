require "application_system_test_case"

class DressesTest < ApplicationSystemTestCase
  require "test_helper"

  # test that the dress index is displaying all dresses
  test "visiting the dress index" do
    visit "/dresses"
    assert_selector "h3", text: "All Our Dresses"
    assert_selector ".dress-card", count: Dress.count
  end

  # test user story: add a new dress listing
  test "lets a signed in user create a new dress" do
    login_as users(:george)
    visit "/dresses/new"

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
  end

  # test user story: book a dress
  # test "lets a signed in user book a dress" do
  #   login_as users(:george)
  #   visit "/dresses/1"

  #   click_on 'Book Dress'
  #   # fill_in "Starting date", with: "2022-04-13"
  #   # page.select "2022-04-13", from: "Starting date"
  #   # page.select("2022/04/14", from: "Ending date")
  #   fill_in "Address", with: "Tokyo"
  #   fill_in "Postal code", with: 1570063

  #   click_on 'Create Booking'
  #   # Should be redirected to listings with new dress
  #   assert_equal profile_path, page.current_path
  #   assert_text "Booked from 2022-04-13 until 2022-04-14"
  # end
end
