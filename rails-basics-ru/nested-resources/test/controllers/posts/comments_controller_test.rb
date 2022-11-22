# frozen_string_literal: true

require 'test_helper'

class PostCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = post_comments(:one)
    @post = posts(:one)
    @attrs = {
      body: 'lala jopa'
    }
  end

  test 'should create comment' do
    post post_comments_url(@post.id), params: { post_comment: @attrs }

    comment = Post::Comment.find_by @attrs

    assert { comment }
    assert_redirected_to post_url(@post)
  end

  test 'should edit comment' do
    get edit_post_comment_url(@post.id, @comment.id)
    assert_response :success
  end

  test 'should update comment' do
    patch post_comment_url(@post.id, @comment.id), params: { post_comment: @attrs }

    @comment.reload

    assert { @comment.body == @attrs[:body] }
    assert_redirected_to post_url(@post)
  end

  test 'should destroy comment' do
    delete post_comment_url(@post.id, @comment.id)

    assert { !Post::Comment.exists?(@comment.id) }

    assert_redirected_to post_url(@post)
  end
end
