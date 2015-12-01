require_relative '../test_helper'

class UserTest < ActiveSupport::TestCase
  test "user is invalid" do
    user = users(:one)
    assert_equal "bigfred", user.username
  end

  test "user is invalid without name" do
    user = users(:one)
    user.name = nil
    refute user.valid?
  end

  test "user is invalid without username" do
    user = users(:one)
    user.username = nil
    refute user.valid?
  end

  test "user is invalid without password" do
    user = users(:one)
    user.password= nil
    refute user.valid?
  end
end
