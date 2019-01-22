require 'test_helper'

class BillCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get bill_comments_create_url
    assert_response :success
  end

  test "should get destroy" do
    get bill_comments_destroy_url
    assert_response :success
  end

  test "should get update" do
    get bill_comments_update_url
    assert_response :success
  end

end
