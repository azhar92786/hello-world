require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  #Devise::Test::IntegrationHelpers
  #include Devise::TestHelpers    
  #Devise::Test::ControllerHelpers

  setup do
    @comment = comments(:one)
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    get comments_url
    assert_response :success
  end

  test "should get new" do
    get new_comment_url
    assert_response :success
  end

  test "should create comment" do
    assert_raises(RecordNotFound) do
      assert_difference('Comment.count') do
        post comments_url, params: { comment: { body: @comment.body, book_id: @comment.book_id, commenter: @comment.commenter } }
      end
    end

    assert_redirected_to comment_url(Comment.last)
  end

  test "should show comment" do
    get comment_url(@comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_comment_url(@comment)
    assert_response :success
  end

  test "should update comment" do
    assert_raises(RecordNotFound) do
      patch comment_url(@comment), params: { comment: { body: @comment.body, book_id: @comment.book_id, commenter: @comment.commenter } }
      assert_redirected_to comment_url(@comment)
    end
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete comment_url(@comment)
    end

    assert_redirected_to comments_url
  end
end
