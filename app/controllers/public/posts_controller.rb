class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    # @posts = current_customer.posts.build(post_params)
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    tag_list = params[:post][:post_tag_names].split(",")
    if @post.save
      @post.save_tag(tag_list)
      redirect_to posts_path
    else
      render :new
    end
  end

  def index
    @posts = Post.page(params[:page])
    # @tag_list = DiagnosisTag.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
    @post_tags = @post.post_tags
  end

  def edit
    @post = Post.find(params[:id])
    @tag_list = @post.post_tags.pluck(:name).join(",")
  end

  def update
    @post = Post.find(params[:id])
    tag_list = params[:post][:post_tag_names].split(",")
    if @post.update(post_params)
      @old_relations = PostTagRelation.where(post_id: @post.id)
      @old_relations.each do |relation|
        relation.delete
      end
      @post.save_tag(tag_list)
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts
  end

  private

  def post_params
    params.require(:post).permit(:introduction, :image)
  end

  # def customer_params
  #   params.require(:customer).permit(:profile_image)
  # end

end
