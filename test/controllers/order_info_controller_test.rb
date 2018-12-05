require 'test_helper'

class OrderInfoControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get order_info_new_url
    assert_response :success
  end

  test "should get show" do
    get order_info_show_url
    assert_response :success
  end

end
