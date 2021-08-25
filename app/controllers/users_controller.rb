class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @post = Post.find(params[:id])

    # favorites = Favorite.where(user_id: current_user.id).order(created_at: :desc).pluck(:post_id)
    # favorites = Favorite.where(user_id: current_user).order(created_at: :desc).pluck(:post_id)
    # @favorite_list = Post.find(favorites)
  end
end
