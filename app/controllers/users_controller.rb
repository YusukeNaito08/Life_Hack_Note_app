class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @post_new = Post.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id]).update(user_params)
    redirect_to user_path(current_user)
  end


private
  def user_params
    params.require(:user).permit(:name, :image)
  end




end
