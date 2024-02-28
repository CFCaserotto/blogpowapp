require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:user)
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "associated blogs should be destroyed" do
    blog = @user.blogs.create!(title: "Example Blog", body: "Lorem ipsum")
    assert_difference ['User.count', 'Blog.count'], -1 do
      @user.destroy
    end
  end

  test "associated comments should be destroyed" do
    @user.save
    blog = @user.blogs.create!(title: "Example Blog", body: "Lorem ipsum")
    blog.comments.create!(body: "Lorem ipsum", user: @user)
    assert_difference 'Comment.count', -1 do
      @user.destroy
    end
  end

  

end
