require 'test_helper'

class VendorTest < ActiveSupport::TestCase
  def valid_attributes
    user = users(:one)
    {
      status: 0,
      name:"Test Store",
      user_id: user.id
    }
  end

  test "that vendor creates a slug" do
    vendor = Vendor.create(valid_attributes)
    assert_equal "test-store", vendor.slug
  end

  test "vendor must have a name in order to be valid" do
    vendor = Vendor.create(
                          status: 0,
                          user_id: 1
                          )
    refute vendor.valid?
  end

  test "vendor must have a user_id to be valid" do
    vendor = Vendor.create(
                          status: 0,
                          )

    refute vendor.valid?
  end                       
end
