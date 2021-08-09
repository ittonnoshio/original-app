class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :search_post, only: [:index, :search_category]

  def index
    @posts = Post.includes(:user).order('created_at DESC')
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
    @post = Post.find(params[:id])
  end

  def search
    @posts = Post.search(params[:keyword])
  end

  def search_category
    # @results = @p.result.includes(:category) 
    @results = @p.result
  end

  private

  def post_params
    params.require(:post).permit(:image, :title, :category_id).merge(user_id: current_user.id)
  end

  def search_post
    @p = Post.ransack(params[:q]) 
  end
end
