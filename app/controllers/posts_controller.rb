class PostsController < ApplicationController


  def create
    @post = Post.new(post_parms)
    @post.user_id = current_user.id
    @post.save
    redirect_to  controller: :users, action: :show, id: current_user
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
    @post_images_files = @post.post_images
  end

  def edit
  end

  def update
  end

  def destroy
  end

private
  def post_parms
    params.require(:post).permit(:title, :content, post_images_files: [])
  end

end
