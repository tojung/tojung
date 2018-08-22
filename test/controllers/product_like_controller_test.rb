require 'test_helper'

class ProductLikeControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get product_like_create_url
    assert_response :success
  end

  test "should get update" do
    get product_like_update_url
    assert_response :success
  end

end
