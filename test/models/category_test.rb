require 'test_helper'

class CategoryTest < ActiveSupport::TestCase


  test "a category can be created" do
    category = Category.new(name: "Hiking")
    assert category.valid?
  end

  test "a category requires a name to be valid" do
    category = Category.new()
    refute category.valid?
  end 
end
