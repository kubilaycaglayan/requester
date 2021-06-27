require 'test_helper'

class RequesterControllerTest < ActionDispatch::IntegrationTest
  test "should get get" do
    get requester_get_url
    assert_response :success
  end

end
