class PostsController < ApplicationController
  
  def index
    @q = Post.ransack(params[:q])
    @q.sorts = 'updated_at desc' if @q.sorts.empty?
    @posts = @q.result.includes(:user, :tags, :post_tag_rerations).page(params[:page]).per(8)
    @tag_ranks = PostTagReration.joins(:tag).group("tag_name").limit(5).order('count_all DESC').count
  end

  def new
    @post = Post.new
    @post.post_images.build
  end

  def create
    @post = Post.new(post_parms)
    @post.user_id = current_user.id
    tag_list = params[:post][:tag_name].split(',')
    if @post.save
      @post.save_posts(tag_list)
      flash[:notice] = "投稿しました"
      redirect_to user_path(@post.user_id)
    else
      flash[:alert] = "投稿に失敗しました"
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
    @post_images_files = @post.post_images
    @tags = @post.tags
    impressionist(@post, nil, unique: [:impressionable_id, :ip_address]) #:session_hash
  end

  def edit
    @post = Post.find(params[:id])
    @tag_list = @post.tags.pluck(:tag_name).join(",")
  end

  def update
    @post = Post.find(params[:id])
    @post.user_id = current_user.id
    tag_list = params[:post][:tag_name].split(',')
    if @post.update_attributes(post_parms)
      @post.save_posts(tag_list)
      flash[:notice] = '投稿を編集しました'
      redirect_to post_path(@post.id)
    else
      flash[:alert] = "投稿の編集、失敗しました"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(current_user)
  end

  private

  def post_parms
    params.require(:post).permit(:title, :content, post_images_files: [])
  end
end
