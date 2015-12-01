require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "an category can be creted" do
    category = Category.new(name: "Hiking")
    assert category.valid?
  end
end
