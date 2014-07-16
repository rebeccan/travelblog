class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:index, :show ]
  
  
  def new
    @post = Post.new
    @gallery = Gallery.new

    if params[:journey]
      @journey = Journey.find(params[:journey])
    end
      
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end
  
  # neuen Post abspeichern
  def create
    @post = Post.new(post_params)
    @journey = Journey.find(params[:post][:journey])
     
    @post.journey = @journey
    
    respond_to do |format|
      if @post.save 

        @gallery = Gallery.new
        @gallery.post = @post
        @gallery.name = @post.title
        @gallery.save

        format.html { redirect_to edit_post_path @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
    @post = Post.find(params[:id])
    @journey = @post.journey
    @photo = Photo.new
    @gallery = Gallery.find(@post.galleries)
  end
   
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Journey was successfully edit.' }
        format.json { render json: @journey, status: :created, location: @journey }
      else
        format.html { render action: "edit" }
        format.json { render json: @posts.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @journey = Journey.find(@post.journey_id)
    @post.destroy
    redirect_to @journey
  end
  
  def show
    @post = Post.find(params[:id])
    @journey = Journey.find(@post.journey_id)
    
    #if user knows url to draft post and is not logged in, redirect him to not found page
    if (@post.draft && !user_signed_in?)
      raise ActionController::RoutingError.new('Couldn\'t find Post with id=' + params[:id])
    end
    @comments = Comment.find_recent(params[:id])
    @comment = Comment.new
    @count_likes = @post.likes.length
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end
  
      # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :date, :text, :journey_id)
    end 
    
    def gallery_params
      params.require(:gallery).permit(:name, :post_id)
    end
end
