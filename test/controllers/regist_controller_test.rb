require 'test_helper'

class RegistControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get regist_index_url
    assert_response :success
  end

  test "should get new" do
    get regist_new_url
    assert_response :success
  end

  test "should get create" do
    get regist_create_url
    assert_response :success
  end

end
