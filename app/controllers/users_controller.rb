class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @q = @user.posts.ransack(params[:q])
    @q.sorts = 'updated_at desc' if @q.sorts.empty?
    @posts = @q.result.includes(:user,:tags, :post_tag_rerations).page(params[:page]).per(8)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'プロフィールを変更しました'
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def bookmarks
    @user = User.find(params[:id])
    bookmark= Bookmark.where(user_id: @user.id).pluck(:post_id)
    @bookmark_list = Post.includes(:tags,:user).find(bookmark)
  end

  def unsubscribe
    @user = User.find(current_user.id)
  end

  def withdrawal
    current_user.is_deleted = true
    current_user.save
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :image)
  end

end
