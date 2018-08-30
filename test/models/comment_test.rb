require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Save comment without anything" do
    comment = Comment.new
    assert_not comment.save
  end

  test "Save comment with body and borrower field" do
    book = books(:one)
    assert comment = book.comments.create(commenter: 'abc@xyz', body: 'nice book'), "couldn't save book even with all correct parameters"
  end
  
end
