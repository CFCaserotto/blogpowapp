require "test_helper"

class CommentTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: 'example@example.com', password: 'password')
    @blog = Blog.new(title: 'Title', body: 'Body')
    @comment = Comment.new(body: 'Test comment', user: @user, blog: @blog)
  end

  test 'should be valid' do
    assert @comment.valid?
  end

  test 'body should be present' do
    @comment.body = ''
    assert_not @comment.valid?
  end

  test 'user_id should be present' do
    @comment.user = nil
    assert_not @comment.valid?
  end

  test 'blog_id should be present' do
    @comment.blog = nil
    assert_not @comment.valid?
  end

  test 'should not save without blog_id' do
    comment = Comment.new(body: 'Test comment', user: @user)
    assert_not comment.save
  end

  test 'should save with blog_id and user_id' do
    @user = User.create(email: 'example@example.com', password: 'password')
    @blog = @user.blogs.build(title: 'Title', body: 'Body')
    comment = Comment.new(body: 'Test comment', user: @user, blog: @blog)
    assert comment.save
  end

end
