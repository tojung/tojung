require 'test_helper'

class ProposeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get propose_index_url
    assert_response :success
  end

  test "should get new" do
    get propose_new_url
    assert_response :success
  end

  test "should get create" do
    get propose_create_url
    assert_response :success
  end

  test "should get edit" do
    get propose_edit_url
    assert_response :success
  end

  test "should get update" do
    get propose_update_url
    assert_response :success
  end

  test "should get delete" do
    get propose_delete_url
    assert_response :success
  end

end
