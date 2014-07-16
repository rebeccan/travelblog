class PhotosController < ApplicationController
  before_filter :authenticate_user!, :except => [:show ]  
    
  
  def show
    @photo = Photo.find(params[:id])
  end
  
  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      redirect_to journeys_path, notice: "The picture #{@photo.url} has been uploaded."
    else
      render "new"
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to photos_path, notice:  "The picture #{@photo.url} has been deleted."
  end

private
  def photo_params
    params.require(:photo).permit(:url, :attachment, :gallery_id, :post_main, :travel_main)
  end  
end
