class PostsController < ApplicationController
  def index
    @posts = Post.published

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
      format.atom
    end
  end

  def show
    @post = Post.published.friendly.find(params[:id])
    @comment = Comment.new

    if request.path != post_path(@post)
      redirect_to @post, status: :moved_permanently
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @post }
      end
    end
  end
end
