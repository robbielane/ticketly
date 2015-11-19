require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def valid_attributes
    {
      name: "Torie",
      username: "Torie@gmail.com",
      password: "password"
    }
  end

  test "user is created with valid attributes" do
    user = User.new(valid_attributes)

    assert user.valid?
    assert_equal "Torie", user.name
    assert_equal "Torie@gmail.com", user.username
    assert_equal "password", user.password
  end

  test "user is invalid with missing name" do
    user = User.new(username: "Torie@gmail.com",
                    password: "password")

    refute user.valid?
  end

  test "user is invalid with missing username" do
    user = User.new(name: "Torie",
                    password: "password")

    refute user.valid?
  end

  test "user is invalid with missing password" do
    user = User.new(name: "Torie",
                    username: "Torie@gmail.com")

    refute user.valid?
  end
end
