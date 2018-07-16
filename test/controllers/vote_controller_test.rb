require 'test_helper'

class VoteControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get vote_index_url
    assert_response :success
  end

  test "should get new" do
    get vote_new_url
    assert_response :success
  end

  test "should get create" do
    get vote_create_url
    assert_response :success
  end

end
