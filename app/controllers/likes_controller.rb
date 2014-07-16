class LikesController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:index, :create]
  
  
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.create(params[:like])
    redirect_to post_path(@post)
  end
  
end
