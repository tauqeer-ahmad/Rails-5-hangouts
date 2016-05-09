require 'test_helper'

class HangersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get hangers_show_url
    assert_response :success
  end

end
