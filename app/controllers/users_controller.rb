class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts

    favorites = Favorite.where(user_id: current_user.id).pluck(:post_id)
    @favorite_list = Post.find(favorites)
  end
end
