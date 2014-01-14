class CommentsController < ApplicationController

def create
	@post = Post.find(params[:post_id])
	@comment = @post.comment.create(comment_params)
	redirect_to @post, notice: 'Comment successfully created!'
end


private
 def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:email, :content)
    end
end