class PostsController < ApplicationController
  
  def new
    @post= Post.new
    @post.post_images.build
  end

  def create
    @post= Post.new(post_parms)
    @post.user_id= current_user.id
    tag_list= params[:post][:tag_name].split(',')
    if @post.save
      @post.save_posts(tag_list)
      redirect_to  controller: :users, action: :show, id: current_user
    end
  end

  def index
    @q= Post.ransack(params[:q])
    @posts= @q.result.includes(:tags, :user).page(params[:page])
    #@bookmark_rank= Bookmark.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id)
    #@tag_ranks= Tag.find(PostTagReration.group(:tag_id).order('count(tag_id)desc').limit(5).pluck(:tag_id))
    @tag_ranks= PostTagReration.joins(:tag).group("tag_name").order('count_all DESC').count
  end
    
  

  def show
    @post= Post.find(params[:id])
    @user= User.find(@post.user_id)
    @post_images_files= @post.post_images
    @tags= @post.tags
    impressionist(@post, nil, unique:[:impressionable_id, :ip_address]) #:session_hash
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

  def search
   @results = @q.result.includes(:tags)
  end

private

  def set_q
  @post= Post.ransack(params[:q])
  end

  def post_parms
    params.require(:post).permit(:title, :content, post_images_files: [])
  end

end
