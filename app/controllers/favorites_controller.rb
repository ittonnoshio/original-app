class FavoritesController < ApplicationController
  before_action :set_post
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @favorite = Favorite.create(user_id: current_user.id, post_id: @post.id) if @post.user_id != current_user.id
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, post_id: @post.id)
    @favorite.destroy
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
