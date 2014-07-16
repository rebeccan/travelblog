class CommentsController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:index, :create]
  
 
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params[:comment].permit(:author, :body))
    @journey = Journey.find(@post.journey_id)
     
    if @comment.save
      redirect_to @post
    else
      @comments = Comment.find_recent(params[:post_id])
      render 'posts/show'
    end
  end
  
  
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
  
end
