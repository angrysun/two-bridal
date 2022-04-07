require "test_helper"

class BookingTest < ActiveSupport::TestCase
  test "Booking can be saved with valid information" do
    booking = Booking.new(dress: Dress.first, user: User.first, starting_date: Date.today, ending_date: Date.tomorrow + 2, address: "Tokyo", post_code: "1234567", total_price: 50000)
    assert booking.save
  end

  test "Booking with incomplete data shouldn't save" do
    booking = Booking.new
    assert_not booking.save
  end
end
