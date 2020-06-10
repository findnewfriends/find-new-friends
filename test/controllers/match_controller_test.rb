require 'test_helper'

class MatchControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get match_index_url
    assert_response :success
  end

  test "should get show" do
    get match_show_url
    assert_response :success
  end

end
