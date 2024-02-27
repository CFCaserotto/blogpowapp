require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: 'example@example.com', password: 'password')
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'email should be present' do
    @user.email = ''
    assert_not @user.valid?
  end

  test 'password should be present' do
    @user.password = ''
    assert_not @user.valid?
  end

  test 'email should be unique' do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'should not save without user_id' do
    blog = Blog.new(title: 'Title', body: 'Body')
    assert_not blog.save
  end

  test 'should save with user_id' do
    user = User.create(email: 'example@example.com', password: 'password')
    blog = user.blogs.build(title: 'Title', body: 'Body')
    assert blog.save
  end

end
