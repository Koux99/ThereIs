class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :admin_check, except: [:index, :show, :search]
  before_action :move_to_index, except: [:index, :show, :search]
  

  def index
    @posts = Post.page(params[:page]).reverse_order
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
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
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

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
