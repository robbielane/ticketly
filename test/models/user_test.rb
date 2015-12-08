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

  test " you can make a user a vendor_admin" do
    user = users(:one)
    role = Role.create(name: "vendor_admin")

    user.roles << role

    assert_equal true, user.vendor_admin?
  end

  test 'you can make a user a platform_admin' do
    user = users(:one)
    role = Role.create(name: "platform_admin")

    user.roles << role

    assert_equal true, user.platform_admin?
  end

  test 'you can make a guest a registered user' do
    user = users(:one)
    role = Role.create(name: "registered_user")

    user.roles << role

    assert_equal true, user.registered_user?
  end 
end
