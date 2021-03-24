class UsersController < ApplicationController
  

  def show
    @user= User.find(params[:id])
    @post= Post.new
    @post.post_images.build
    @posts= @user.posts
  
  end

  def edit
    @user= User.find(params[:id])
  end

  def update
    @user= User.find(params[:id]).update(user_params)
    flash[:notice]= "プロフィールを変更しました"
    redirect_to user_path(current_user)
  end

  def unsubscribe
    @user= User.find(current_user.id)
  end

  def withdrawal
   current_user.is_deleted= true
   current_user.save
   reset_session
   redirect_to root_path
  end


private
  def user_params
    params.require(:user).permit(:name, :image)
  end


end
