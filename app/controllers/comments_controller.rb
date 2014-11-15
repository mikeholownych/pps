class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
logger.debug "about to build comments with these params #{comment_params.inspect} - from these params #{params.inspect}"
    @comment = @post.comments.build(comment_params)


    if @comment.save

      respond_to do |format|
        format.html { redirect_to @post }
        format.js
      end
    else
        render @post
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
