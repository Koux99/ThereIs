class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :admin_check, except: [:index, :show]
  
  
  def index
    @posts = Post.all
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

  private
  def post_params
    params.require(:post).permit(:title, :lead_text, :text, :image).merge(user_id: current_user.id)
  end
  
  def set_post
    @post = Post.find(params[:id])
  end

  def admin_check
    unless current_user.admin?
      redirect_to root_path
    end
  end

end
