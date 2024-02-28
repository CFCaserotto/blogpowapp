require 'test_helper'

class AdminDashboardTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "admin can access dashboard" do
    admin_user = users(:user)
    admin_user.update(admin: true)

    sign_in admin_user
    get admin_dashboard_index_url

    assert_response :success
    assert_select "h1", "Hello, welcome to admin section"
  end
end