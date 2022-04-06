require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "User can be saved with valid information" do
    user = User.new(first_name: "John", last_name: "Cena", email: "jc@gmail.com", password: "1234567")
    assert_equal "John Cena", "#{user.first_name} #{user.last_name}"
  end

  test "User is not saved with incomplete data" do
    user = User.new(first_name: "John", last_name: "Cena", password: "1234567")
    assert_not user.save # doesn't save the user without an email
  end
end
