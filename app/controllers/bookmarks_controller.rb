class BookmarksController < ApplicationController
  
  
  def create
    @post = Post.find(params[:post_id])
    bookmark= current_user.bookmarks.build(post_id: params[:post_id])
    bookmark.save
  end  
  
  def destroy
    @post = Post.find(params[:post_id])
    bookmark= Bookmark.find_by(post_id: params[:post_id], user_id: current_user.id)
    bookmark.destroy
  end  
  
  def index
   @bookmarks_rank= Post.order(bookmarks_count: 'DESC').limit(5)
  end
  
  
  
end
