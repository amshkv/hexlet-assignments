# frozen_string_literal: true

class CommentsController < Posts::ApplicationController
  def create
    resource_post.comments.create! comment_params
    redirect_to resource_post
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
