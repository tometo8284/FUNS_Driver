require "test_helper"

class PublicControllerTest < ActionDispatch::IntegrationTest
  test "should get notifications" do
    get public_notifications_url
    assert_response :success
  end

  test "should get index" do
    get public_index_url
    assert_response :success
  end
end
