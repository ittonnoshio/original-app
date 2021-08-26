class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :search_post, only: [:index, :search_category]

  def index
    @posts = Post.includes(:user).order('created_at DESC')
    @categories = Category.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    # @user = User.find(params[:post_id])
    # @user = User.find(params[:id])
    # @user = User.find(params[:follow_id])
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  def search
    @posts = Post.search(params[:keyword])
  end

  def search_category
    # @results = @p.result.includes(:category)
    @results = @p.result
  end

  def move_to_index
    redirect_to root_path unless current_user.id == @post.user_id
  end

  private

  def post_params
    params.require(:post).permit(:title, :category_id, images: []).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def search_post
    @p = Post.ransack(params[:q])
  end
end
