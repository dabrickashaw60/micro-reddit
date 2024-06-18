class CommentsController < ApplicationController
  before_action :require_user

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @post, notice: 'Comment was successfully posted'
    else
      redirect_to @post, alert: 'Comment could not be created'
    end
  end

  def destroy
    @comment.destroy
    redirect_to @comment.post, notice: 'Comment was successfully removed'
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  end
