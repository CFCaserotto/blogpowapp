class CommentsController < ApplicationController
  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.create(comment_params)
    redirect_to blog_path(@blog)
  end
  
  def destroy
    if current_user.admin?
      @blog = Blog.find(params[:blog_id])
      @comment = @blog.comments.find(params[:id])
      @comment.destroy
      redirect_to admin_dashboard_index_path, status: :see_other
    else
      @blog = Blog.find(params[:blog_id])
      @comment = @blog.comments.find(params[:id])
      @comment.destroy
      redirect_to blog_path(@blog), status: :see_other
    end
  end
              
  private
  def comment_params
    params.require(:comment).permit(:body, :blog_id, :user_id)
  end
end