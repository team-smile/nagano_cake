require 'test_helper'

class Admin::OrderDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get confirm" do
    get admin_order_details_confirm_url
    assert_response :success
  end

end
