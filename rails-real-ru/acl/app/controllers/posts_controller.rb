# frozen_string_literal: true

class PostsController < ApplicationController
  after_action :verify_authorized, except: %i[index show]

  # BEGIN
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    authorize Post

    @post = current_user.posts.build(permitted_params)

    if @post.save
      redirect_to @post, notice: I18n.t('post.create.success')
    else
      render :new, status: :unprocessable_entity, alert: I18n.t('post.create.failure')
    end
  end

  def edit
    @post = Post.find(params[:id])

    authorize @post
  end

  def update
    @post = Post.find(params[:id])

    authorize @post

    if @post.update(permitted_params)
      redirect_to @post, notice: I18n.t('post.update.success')
    else
      render :edit, status: :unprocessable_entity, alert: I18n.t('post.update.failure')
    end
  end

  def destroy
    post = Post.find(params[:id])

    authorize post

    post.destroy

    redirect_to posts_path, notice: I18n.t('post.destroy.success')
  end

  private

  def permitted_params
    params.require(:post).permit(:title, :body)
  end
  # END
end
