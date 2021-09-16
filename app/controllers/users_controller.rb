class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts

    likes = Like.where(user_id: current_user.id).pluck(:post_id)
    @like_list = Post.find(likes)
  end

end
