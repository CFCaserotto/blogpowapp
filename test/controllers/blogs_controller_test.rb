require "test_helper"

class BlogsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:user_1)
    @blog = blogs(:blog)
    sign_in users(:user_1)
    #post user_session_url
  end

  test "should get login page" do
    sign_out users(:user_1)
    get new_user_session_url
    assert_response :success
  end
  test "should get sign up page" do
    sign_out users(:user_1)
    get new_user_registration_url
    assert_response :success
  end
  test "should get blogs page" do
    get blogs_url
    assert_response :success
  end
  test "should create blog" do
    assert_difference('Blog.count') do
      post blogs_url, params: { blog: { title: @blog.title, body: @blog.body, user_id: @user.id } }
    end

    assert_redirected_to blog_path(assigns(:blog))
  end

  test "should show blog" do
    get blogs_url, params: { id: @blog.id }
    assert_response :success
  end
  test "should get edit" do
    get edit_blog_path(@blog)
    assert_response :success
  end

  test "should update blog" do
    patch blog_url(@blog), params: { blog: { title: "new_title" } }
    assert_redirected_to blog_path(assigns(:blog))
  end

  test "should destroy blog" do
    assert_difference('Blog.count', -1) do
      delete blog_url(@blog)
    end

    assert_redirected_to blogs_path
  end
  
end
