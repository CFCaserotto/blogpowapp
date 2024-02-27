class CommentsController < ApplicationController
    def create
        #binding.break
        @blog = Blog.find(params[:blog_id])
        @comment = @blog.comments.create(comment_params)
        redirect_to blog_path(@blog)
      end
      def destroy
        @blog = Blog.find(params[:blog_id])
        @comment = @blog.comments.find(params[:id])
        @comment.destroy
        redirect_to blog_path(@blog), status: :see_other
      end
              
      private
      def comment_params
        params.require(:comment).permit(:body, :blog_id, :user_id)
      end
end