require 'test_helper'

class InterestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get interests_index_url
    assert_response :success
  end

end
