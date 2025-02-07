class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.add_favorite(micropost)
    flash[:success] = "投稿をお気に入りに追加しました"
    redirect_to root_path
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.delete_favorite(micropost)
    flash[:success] = "お気に入りを解除しました"
    redirect_to root_path
  end
end
