require 'test_helper'

class IntegrationBlogTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:user_1)
  end

  test "can view blog index" do
    get "/blogs"
    assert_response :success
  end

  test "can create new blog" do
    post "/blogs", params: { blog: { title: "New Blog", body: "This is a new blog", user_id: 1 } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "h2", "Comments"
  end
end