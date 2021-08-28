class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @favorite_posts = @user.favorite_posts
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'show'
  end
end
