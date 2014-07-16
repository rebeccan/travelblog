class GalleriesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show ]
 
   def new
    @gallery = Gallery.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gallery }
    end
  end 
  
  def index
    if user_signed_in?
      @galleries = Gallery.find_recent
    else
      @galleries = Gallery.find_recent_not_draftpost_publicjourney
    end
  end
  
  def show
    @gallery = Gallery.find(params[:id])
    @photos = @gallery.photos(:oder => 'updated_at DESC')
  end
  
  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    redirect_to galleries_url
  end
  
  
  def edit
    @gallery = Gallery.find(params[:id])
  end
  
  
  def update
    @gallery = Gallery.find(params[:id])
    respond_to do |format|
      if @gallery.update(gallery_params)
        format.html { redirect_to @gallery, notice: 'Gallery was successfully edit.' }
      else
        format.html { render action: "edit" }
      end
    end
  end
  
  
  def create
    @gallery = Gallery.new(gallery_params)

    respond_to do |format|
      if @gallery.save
        format.html { redirect_to @gallery, notice: 'Gallery was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end
  
  def new
    @gallery = Gallery.new
  end
  
  
  def gallery_params
    params.require(:gallery).permit(:name, :post_id)
  end
  
end
