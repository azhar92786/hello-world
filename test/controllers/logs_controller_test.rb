require 'test_helper'

class LogsControllerTest < ActionDispatch::IntegrationTest
   include Devise::Test::IntegrationHelpers
  #Devise::Test::IntegrationHelpers
  #include Devise::TestHelpers    

  setup do
    @log = logs(:one)
    @user = users(:one)
    @book = books(:one)
    @book2 = books(:two)
    sign_in @user
  end

  test "should get index" do
    get logs_url
    assert_response :success
  end

  test "should get new" do
    get new_log_url
    assert_response :success
  end

  test "should create log after book is borrowed" do
    assert_difference('Log.count') do
      patch book_borrow_path(@book), params: {book: {borrower: 'azharpremier@gmail.com'}}
    end
    assert_redirected_to books_path
  end

  test "should create log after book is returned" do
    assert_difference('Log.count') do
      patch book_return_path(@book2), params: {book: {borrower: nil}}
    end
    assert_redirected_to books_path
  end

  test "should show log" do
    get log_url(@log)
    assert_response :success
  end

  test "should get edit" do
    get edit_log_url(@log)
    assert_response :success
  end

  test "should update log" do
    patch log_url(@log), params: { log: { book_id: @log.book_id, description: @log.description, user_id: @log.user_id } }
    assert_redirected_to log_url(@log)
  end

  test "should destroy log" do
    assert_difference('Log.count', -1) do
      delete log_url(@log)
    end

    assert_redirected_to logs_url
  end
end
