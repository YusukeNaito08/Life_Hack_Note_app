class PostsController < ApplicationController


  def create
    @post = Post.new(post_parms)
    @post.user_id = current_user.id
    @post.save
    redirect_to user_path(current_user)
  end

  def index
  end

  def show
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
