require 'test_helper'

class ProductControllerTest < ActionDispatch::IntegrationTest
  test "should get list" do
    get product_list_url
    assert_response :success
  end

  test "should get detail" do
    get product_detail_url
    assert_response :success
  end

end
