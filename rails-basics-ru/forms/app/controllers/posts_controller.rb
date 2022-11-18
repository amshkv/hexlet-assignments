class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(permited_params)

    if @post.save
      flash[:notice] = 'Post was successfully created.'
      redirect_to post_path(@post)
    else
      flash[:alert] = 'Post was not created.'
      render :new, status: :unsupported_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(permited_params)
      flash[:notice] = 'Post was successfully updated.'
      redirect_to post_path(@post)
    else
      flash[:alert] = 'Post was not updated.'
      render :edit, status: :unsupported_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'Post was successfully deleted.'
    redirect_to posts_path
  end

  private

  def permited_params
    params.require(:post).permit(:title, :body, :published, :summary)
  end
end
