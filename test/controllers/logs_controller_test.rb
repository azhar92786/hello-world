require 'test_helper'

class LogsControllerTest < ActionDispatch::IntegrationTest
   include Devise::Test::IntegrationHelpers
  #Devise::Test::IntegrationHelpers
  #include Devise::TestHelpers    

  setup do
    @log = logs(:one)
    # @request.env["devise.mapping"] = Devise.mappings[:user]
    # sign_in FactoryBot.create(:user)
    @user = users(:one)
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

  test "should create log" do
    assert_difference('Log.count') do
      post logs_url, params: { log: { book_id: @log.book_id, description: @log.description, user_id: @log.user_id } }
    end

    assert_redirected_to log_url(Log.last)
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
