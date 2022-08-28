class Public::PostsController < ApplicationController
  def new
    @posts = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def index
     @posts = Post.page(params[:page])
  end

  def show
  end

  def edit
  end


  private

  def post_params
    params.require(:post).permit(:introduction, :image)
  end

end
