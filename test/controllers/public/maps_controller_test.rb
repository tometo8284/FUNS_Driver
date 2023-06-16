require "test_helper"

class Public::MapsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get public_maps_edit_url
    assert_response :success
  end
end
