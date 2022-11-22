# frozen_string_literal: true

class Posts::CommentsController < Posts::ApplicationController
  def create
    @comment = resource_post.comments.build(comment_params)
    if @comment.save
      redirect_to resource_post, notice: 'Comment was created'
    else
      @post = resource_post
      flash[:alert] = 'Comment could not be created'
      render 'posts/show'
    end
  end

  def edit
    @comment = resource_post.comments.find params[:id]
  end

  def update
    @comment = resource_post.comments.find params[:id]
    if @comment.update comment_params
      redirect_to @comment.post
    else
      render :edit, notice: 'Comment could not be updated', status: :unprocessable_entity
    end
  end

  def destroy
    comment = resource_post.comments.find params[:id]
    comment.destroy
    redirect_to resource_post
  end

  private

  def comment_params
    params.require(:post_comment).permit(:body)
  end
end
