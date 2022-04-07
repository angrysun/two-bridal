require "test_helper"

class DressTest < ActiveSupport::TestCase
  test "Dress can be saved with valid information" do
    dress = Dress.new(brand: "Versace", color: "White", size: 4, style: "Column", description: "Very pretty", price_per_day: 4000, user: User.first)
    assert dress.save
  end

  test "Dress with incomplete data shouldn't save" do
    dress = Review.new
    assert_not dress.save
  end
end
