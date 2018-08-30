require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not create category with blank name" do
    category = Category.new
    assert_not category.save
  end

  test "should save category with name" do
    category = Category.new
    category.name = 'adventure'
    assert category.save
  end

  test "should not save category with same name" do
    Category.create(name: 'adventure')
    assert_no_changes('Category.count') do
      Category.create(name: 'adventure')
    end   
   end

end
