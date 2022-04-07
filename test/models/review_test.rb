require "test_helper"

class ReviewTest < ActiveSupport::TestCase
  test "Review can be saved with valid information" do
    review = Review.new(rating: 5, comment: "Best dress ever", dress: Dress.first, user: User.first)
    assert review.save
  end

  test "Review with incomplete data shouldn't save" do
    review = Review.new
    assert_not review.save
  end
end
