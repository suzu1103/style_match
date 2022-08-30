class Public::PostsController < ApplicationController
  def new
    @posts = Post.new
  end

  def create
    @posts = current_customer.posts.build(post_params)
    if @posts.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def index
    @posts = Post.page(params[:page])
    # @customer = Customer.find(params[:id])

  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
  end

  def edit
  end

  private

  def post_params
    params.require(:post).permit(:introduction, :image)
  end

  # def customer_params
  #   params.require(:customer).permit(:profile_image)
  # end

end
