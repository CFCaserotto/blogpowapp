require "test_helper"

class BlogTest < ActiveSupport::TestCase
  def setup
    @user = users(:user)
    @blog = blogs(:blog)
  end

  test "should be valid" do
    assert @blog.valid?
  end

  test "title should be present" do
    @blog.title = "     "
    assert_not @blog.valid?
  end

  test "body should be present" do
    @blog.body = "     "
    assert_not @blog.valid?
  end

  test "user should be present" do
    @blog.user = nil
    assert_not @blog.valid?
  end

  test "should destroy associated comments" do
    @blog.save
    @blog.comments.create!(body: "Some content", user: @user)

    assert_difference 'Comment.count', -1 do
      @blog.destroy
    end
  end

end
