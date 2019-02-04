require 'test_helper'

class ProductOptionApiControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get product_option_api_show_url
    assert_response :success
  end

end
