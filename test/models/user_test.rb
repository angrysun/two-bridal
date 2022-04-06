require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "full_name returns the capitalized first name and last name" do
    user = User.new(first_name: "John", last_name: "Cena", email: "jc@gmail.com",password: "1234567")
    assert_equal "John Cena", "#{user.first_name} #{user.last_name}"
  end
end
