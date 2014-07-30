class LikesController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:index, :create]
  
  
  def create
    @post = Post.find(params[:post_id])
    @post.likes.create(params[:like])
    #use in JS function to manipulate DOM
    @count_likes = @post.likes.length 
   
    respond_to do |format|
      format.html { redirect_to post_path(@post) }
      format.js {
          #manipulate DOM + make Like button disappear
          render :template => 'likes/create.js.erb'
        }
    end
  end
  
end
