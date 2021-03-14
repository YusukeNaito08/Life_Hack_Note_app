class PostsController < ApplicationController


  def create
    @post= Post.new(post_parms)
    @post.user_id= current_user.id
    tag_list= params[:post][:tag_name].split(nil) 
    if @post.save
      @post.save_posts(tag_list)
      redirect_to  controller: :users, action: :show, id: current_user
    end
  end

  def index
    @q= Post.ransack(params[:q])
    @posts= @q.result.includes(:tags) 

  end
  

  def show
    @post= Post.find(params[:id])
    @user= User.find(@post.user_id)
    @post_images_files= @post.post_images
    @tags= @post.tags
  end

  def edit
    @post= Post.find(params[:id])
  end

  def update
    @post= Post.find(params[:id])
    @post.update(post_parms)
    redirect_to post_path(@post.id)
  end

  def destroy
    @post= Post.find(params[:id])
    @post.destroy
    redirect_to user_path(current_user)
  end

private
  def post_parms
    params.require(:post).permit(:title, :content, post_images_files: [])
  end

end
